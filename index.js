const express = require('express');
const bcrypt = require('bcrypt')
const path = require('path');
const{open}= require('sqlite');
const sqlite3 = require('sqlite3');
const jwt= require('jsonwebtoken');
const { request, response } = require('express');

const db_path = path.join(__dirname, 'instagram.db');

const app=express();
app.use(express.json());
let db=null;
const initializeDatabaseAndServer = async () => {
    try{
        db = await open({
            filename:db_path,
            driver:sqlite3.Database,
        });
        const port = process.env.PORT || 3005;
        app.listen(port, () => {
            console.log(`Started server at port ${port}...`)   //3306
        });
    }
    catch(e){
        console.log(e)
    }
}

initializeDatabaseAndServer()

const authenticateUser = (request, response, next) => {
    let jwtToken;
    const authHeader = request.headers['authorization'];
    if (authHeader!==undefined){
        jwtToken = authHeader.split(" ")[1];
    }
    if (jwtToken === undefined) {
        response.status(401);
        response.send('Invalid Access Token');
    }
    else{
        jwt.verify(jwtToken, "qwertyuiop", (error, payload) => {
            if (error){
                response.status(401);
                response.send('Invalid Access Token');
            }
            else{
                request.username=payload.username
                next();
            }
        });
    }
};

app.post("/users/signup", async(request, response) => {
    const{email, fullName, username, password} = request.body;
    const hashedPassword = await bcrypt.hash(password,10);
    const checkUserQuery = `SELECT * FROM user WHERE username='${username}'`
    const dbUser = await db.get(checkUserQuery);
    if (dbUser===undefined){
        const signUpUserQuery = `
            INSERT INTO user(email, full_name, username, password) 
            VALUES ('${email}', '${fullName}', '${username}', '${hashedPassword}');`;
            await db.run(signUpUserQuery);
            response.set('Access-Control-Allow-Origin', '*');
            response.send(`Welcome ${fullName}`)
    }
    else{
        response.set('Access-Control-Allow-Origin', '*');
        response.status = 400;
        response.send('User already exists')
    }
});

app.post('/login', async (request, response) => {
    const {username, password} = request.body;
    const checkUserQuery = `SELECT * FROM user WHERE username='${username}'`;
    const dbUser = await db.get(checkUserQuery);
    if (dbUser===undefined){
        response.set('Access-Control-Allow-Origin', '*');
        response.status(400)
        response.send('username does not exists')
    }
    else{
        const passwordCheck = await bcrypt.compare(password, dbUser.password);
        if (passwordCheck===true){
            const payload = {
                username: username,
            };
            const jwt_token = jwt.sign(payload, 'qwertyuiop')
            response.set('Access-Control-Allow-Origin', '*');
            response.send({jwt_token})
        }
        else{
            response.set('Access-Control-Allow-Origin', '*');
            response.status(400);
            response.send("Invalid Password")
        }
    }
})

app.get('/home/posts', authenticateUser, async (request, response) => {
    const {username} = request;
    const getPostsQuery = `
    SELECT 
        post.post_id as id,
        user.profile_image_url as friend_profile_image,
        user.full_name as friend_name,
        post.post_url as post_content,
        post.post_created_time as friend_post_time,
        (SELECT full_name FROM user WHERE username='${username}') AS user,
        COUNT(post_likes.id) AS likes
    FROM (post 
        JOIN user ON post.user_id = user.user_id) AS T 
        JOIN followers ON followers.following_id = T.user_id
        LEFT JOIN post_likes ON post.post_id = post_likes.post_id
    WHERE followers.follower_id = (
        SELECT user.user_id
        FROM user
        WHERE user.username = '${username}') 
    GROUP BY post.post_id
    ORDER BY post.post_created_time DESC;`;
    const postsResponse=await db.all(getPostsQuery);
    response.set('Access-Control-Allow-Origin', '*');
    response.send({postsResponse});
});

app.post('/home/posts/:postId/likes', authenticateUser, async (request, response) => {
    const{postId} = request.params
    const{username} = request
    const likeDetails  = request.body
    const {likedTime} = likeDetails
    const getLikeQuery = `
        SELECT 
            *
        FROM 
            post_likes
            JOIN user ON user.user_id = post_likes.user_id
        WHERE 
            post_likes.post_id = ${postId} AND user.username = '${username}';`;
    const dbLike = await db.get(getLikeQuery)
    if (dbLike === undefined){
        const setLikeQuery = `
            INSERT INTO
                post_likes(post_id, user_id, liked, liked_time)
            SELECT 
                ${postId}, user_id, true, '${likedTime}'
            FROM user
            WHERE user.username = '${username}';`;
        await db.run(setLikeQuery);
        response.send("success")
    }
    else{
        const deleteLikeQuery = `
            DELETE FROM
                post_likes
            WHERE 
                post_id=${postId} 
                AND user_id = (
                SELECT 
                    user_id
                FROM 
                    user
                WHERE 
                    username='${username}');`;
        await db.run(deleteLikeQuery);
        response.send({liked:false})
    }
})

app.get('/home/post/:postId/liked', authenticateUser, async(request, response) => {
    const{postId} = request.params
    const{username} = request
    const getLikeQuery = `
        SELECT 
            *
        FROM 
            post_likes
            JOIN user ON user.user_id = post_likes.user_id
        WHERE 
            post_likes.post_id = ${postId} AND user.username = '${username}';`;
    const dbLiked = await db.get(getLikeQuery)
    if (dbLiked===undefined){
        response.send({liked:false})
    }
    else{
        response.send({liked:true})
    }
})

app.get('/home/posts/:postId/comments', authenticateUser, async(request, response) => {
    const {postId} = request.params;
    const getPostCommentsQuery = `
        SELECT
            comment.comment_id AS id,
            user.full_name AS commenters,
            comment.comment_text AS comment,
            comment.liked_status AS liked
        FROM 
            comment
            JOIN user ON comment.user_id=user.user_id
        WHERE comment.post_id = ${postId}
        ORDER BY comment.commented_time DESC;
    `;
    const data= await db.all(getPostCommentsQuery);
    response.send({data});
});

app.post('/home/posts/:postId/comments', authenticateUser, async(request, response) => {
    const {postId} = request.params;
    const {username} = request
    const {comment, commentTime} = request.body
    const postCommentQuery = `
        INSERT INTO
            comment(user_id,post_id,comment_text, commented_time, liked_status)
        SELECT 
            user_id, ${postId}, '${comment}', '${commentTime}', true
        FROM 
            user
        WHERE 
            user.username='${username}';`;
    await db.run(postCommentQuery)
    response.send('comment updated')
})

app.get('/home/friendsuggestions', authenticateUser,async(request, response) => {
    const {username} = request
    const getSuggestionsQuery = `
    SELECT 
        user.user_id as id,
        user.profile_image_url as friend_profile_image,
        user.pet_name,
        user.full_name as friend_name
        
    FROM user 
        JOIN followers ON user.user_id=followers.follower_id
    WHERE 
    followers.following_id = (
        SELECT 
            user.user_id
        FROM user
            JOIN followers ON user.user_id = followers.following_id
        WHERE user.username = '${username}')
    UNION
    SELECT 
        user.user_id as id,
        user.profile_image_url as friend_profile_image,
        user.pet_name,
        user.full_name as friend_name
    FROM user 
        JOIN followers ON user.user_id=followers.following_id
    WHERE 
    followers.follower_id = (
        SELECT 
            user.user_id
            
        FROM user 
            JOIN followers ON user.user_id=followers.follower_id
        WHERE 
        followers.following_id = (
            SELECT 
                user.user_id
            FROM user
                JOIN followers ON user.user_id = followers.following_id
            WHERE user.username = '${username}'))
    EXCEPT
    SELECT 
        user.user_id as id,
        user.profile_image_url as friend_profile_image,
        user.pet_name,
        user.full_name as friend_name
    FROM user 
        JOIN followers ON user.user_id=followers.following_id
    WHERE 
    followers.follower_id = (
        SELECT user.user_id
        FROM user
            JOIN followers ON user.user_id = followers.follower_id
        WHERE user.username = '${username}') 
    EXCEPT
        SELECT 
            user.user_id as id,
            user.profile_image_url as friend_profile_image,
            user.pet_name,
            user.full_name as friend_name
        FROM user
        WHERE username='${username}'
        
    ;`;
    
    const data = await db.all(getSuggestionsQuery)
    response.send({data})
})

app.get('/owner', authenticateUser, async(request, response) => {
    const {username} = request
    const getOwnerDetails = `
        SELECT 
            user.user_id,
            user.pet_name,
            user.profile_image_url AS profile_picture,
            user.full_name,
            COUNT(post.post_id) as posts,
            (SELECT 
                COUNT(followers.follower_id)
            FROM 
                followers 
                JOIN user ON followers.following_id = user.user_id
            WHERE 
                user.username = '${username}') as followers,
            (SELECT 
                COUNT(followers.following_id)
            FROM 
                followers 
                JOIN user ON followers.follower_id = user.user_id
            WHERE 
                user.username = '${username}') as following
        FROM user 
            JOIN post ON post.user_id = user.user_id
        WHERE user.username = '${username}';`;
    const data = await db.get(getOwnerDetails)
    response.send(data)
})

app.get('/owner/posts', authenticateUser, async (request, response) => {
    const{username} = request
    const getOwnerPostsQuery = `
        SELECT 
            post.post_id,
            post.post_type,
            post.post_url,
            post.post_created_time
        FROM 
            post
            JOIN user ON post.user_id = user.user_id
        WHERE 
            user.username = '${username}'
        ORDER BY post.post_created_time DESC;`;
    const data = await db.all(getOwnerPostsQuery);
    response.send({data})
})

app.post('/owner/posts', authenticateUser, async (request, response) => {
    const{username} = request
    const{postType, postUrl, postCreatedTime, postDescription, postPrivacy} = request.body
    const setPostQuery = `
        INSERT INTO 
            post(post_type, post_url, user_id, post_created_time, post_description, post_privacy)
        SELECT 
            '${postType}', '${postUrl}', user_id, '${postCreatedTime}', '${postDescription}', '${postPrivacy}'
        FROM user
        WHERE 
            user.username = '${username}';`;
    await db.run(setPostQuery)
    response.send("Posted Successfully")
})

app.post('/home/posts/:postId/saved', authenticateUser, async (request, response) => {
    const{postId} = request.params
    const{username} = request
    const savedPostDetails  = request.body
    const {savedTime} = savedPostDetails
    const getSavedPostQuery = `
        SELECT 
            *
        FROM 
        saved_posts
            JOIN user ON user.user_id = saved_posts.user_id
        WHERE 
            saved_posts.post_id = ${postId} AND user.username = '${username}';`;
    const dbSaved = await db.get(getSavedPostQuery)
    if (dbSaved === undefined){
        const setSavedPostQuery = `
            INSERT INTO
                saved_posts(post_id, user_id, saved_time)
            SELECT 
                ${postId}, user_id, '${savedTime}'
            FROM user
            WHERE user.username = '${username}';`;
        await db.run(setSavedPostQuery);
        response.send("success")
    }
    else{
        const removeSavedQuery = `
            DELETE FROM
                saved_posts
            WHERE 
                post_id=${postId} 
                AND user_id = (
                SELECT 
                    user_id
                FROM 
                    user
                WHERE 
                    username='${username}');`;
        await db.run(removeSavedQuery);
        response.send("success")
    }
})

app.get('/home/post/:postId/saved', authenticateUser, async(request, response) => {
    const{postId} = request.params
    const{username} = request
    const getSavedPostQuery = `
        SELECT 
            *
        FROM 
        saved_posts
            JOIN user ON user.user_id = saved_posts.user_id
        WHERE 
            saved_posts.post_id = ${postId} AND user.username = '${username}';`;
    const dbSaved = await db.get(getSavedPostQuery)
    if (dbSaved===undefined){
        response.send({saved:false})
    }
    else{
        response.send({saved:true})
    }
})

app.get('/owner/saved', authenticateUser, async (request, response) => {
    const{username} = request
    const getOwnerSavedPostsQuery = `
        SELECT 
            post.post_id,
            post.post_type,
            post.post_url,
            post.post_created_time
        FROM 
            post
            JOIN saved_posts ON post.post_id = saved_posts.post_id
            JOIN user ON saved_posts.user_id = user.user_id
        WHERE 
            user.username = '${username}'
        ORDER BY post.post_created_time DESC;`;
    const data = await db.all(getOwnerSavedPostsQuery);
    response.send({data})
})

app.get('/owner/info', authenticateUser, async (request, response) => {
    const {username} = request;
    const getOwnerInfoQuery = `
        SELECT 
            pet_name, full_name, profile_image_url, user_id
        FROM 
            user
        WHERE 
            username='${username}';
    `;
    const userDate = await db.get(getOwnerInfoQuery);
    response.send(userDate)   
})

app.get('/posts/:postId', authenticateUser, async(request, response) => {
    const {postId} = request.params
    const {username} = request
    const getPostQuery = `
    SELECT 
        post.post_id as id,
        user.profile_image_url as friend_profile_image,
        user.full_name as friend_name,
        user.pet_name as pet_name,
        post.post_url as post_content,
        post.post_created_time as friend_post_time,
        (SELECT full_name FROM user WHERE username='${username}') AS user,
        COUNT(post_likes.id) AS likes
    FROM (post 
        JOIN user ON post.user_id = user.user_id) AS T 
        JOIN followers ON followers.following_id = T.user_id
        LEFT JOIN post_likes ON post.post_id = post_likes.post_id
    WHERE post.post_id=${postId} AND 
    followers.follower_id = (
        SELECT user.user_id
        FROM user
        WHERE user.username = '${username}') ; 
        `;
    const data = await db.get(getPostQuery);
    response.send({data})
})

app.get('/posts/:postId/other', async (request, response) => {
    const {postId} = request.params
    const {limit} = request.query
    const getFriendOtherPostsQuery = `
    SELECT 
        post.post_id,
        post.post_type,
        post.post_url,
        post.post_created_time,
        user.username
    FROM 
        post
        JOIN user ON post.user_id = user.user_id
    WHERE 
        post.post_id <>${postId}
        AND user.user_id = (
            SELECT user_id
            FROM post
            WHERE post_id = ${postId}
        )
    ORDER BY post.post_created_time DESC
    LIMIT ${limit};`;

    const data = await db.all(getFriendOtherPostsQuery)
    response.send({data})
})