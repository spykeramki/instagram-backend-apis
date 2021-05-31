const express = require('express');
const bcrypt = require('bcrypt')
const path = require('path');
const{open}= require('sqlite');
const sqlite3 = require('sqlite3');
const jwt= require('jsonwebtoken')

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
            console.log(`Started server at port ${port}...`)
        });
    }
    catch(e){
        console.log(e)
    }
}

initializeDatabaseAndServer()

app.post("/users/", async(request, response) => {
    const{email, full_name, username, password} = request.body;
    const hashedPassword = await bcrypt.hash(password,10);
    const checkUserQuery = `SELECT * FROM user WHERE username='${username}'`
    const dbUser = await db.get(checkUserQuery);
    if (dbUser===undefined){
        const signUpUserQuery = `
            INSERT INTO user(email, full_name, username, password) 
            VALUES ('${email}', '${full_name}', '${username}', '${hashedPassword}');`;
            await db.run(signUpUserQuery);
            response.set('Access-Control-Allow-Origin', '*');
            response.send(`Welcome ${full_name}`)
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
        const jwtToken = await jwt.sign(payload, 'qwertyuiop')
        response.set('Access-Control-Allow-Origin', '*');
        response.send({jwtToken})
        }
        else{
            response.set('Access-Control-Allow-Origin', '*');
            response.status(400);
            response.send("Invalid Password")
        }
    }
})
