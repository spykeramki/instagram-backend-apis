SELECT 
    post.post_id as id,
    user.profile_image_url as friend_profile_image,
    user.full_name as friend_name,
    post.post_url as post_content,
    post.post_created_time as friend_post_time
FROM (post 
    JOIN users ON post.user_id = user.user_id) AS T 
    JOIN followers ON followers.follower_id = T.user_id
WHERE followers.following_id = (
    SELECT user.user_id
    FROM user
        JOIN followers ON user.user_id = followers.following_id
    WHERE user.username = ${username}
);
    
SELECT 
            comment.comment_id as id,
            user.full_name as username,
            comment.comment_text as comment
        FROM comment
            JOIN post ON comment.post_id = post.post_id
            JOIN user ON comment.user_id = user.user_id



UPDATE user SET profile_image_url = "https://res.cloudinary.com/dwlftsdge/image/upload/v1622897468/Instagram%20App/Nature%20images/profile%20images/5366575_jrfppm.jpg" WHERE user_id=1;
UPDATE user SET profile_image_url = "https://res.cloudinary.com/dwlftsdge/image/upload/v1622897468/Instagram%20App/Nature%20images/profile%20images/5397329_ipd1hq.jpg" WHERE user_id= 2;
UPDATE user SET profile_image_url = "https://res.cloudinary.com/dwlftsdge/image/upload/v1622897469/Instagram%20App/Nature%20images/profile%20images/60111_h9p6tn.jpg" WHERE user_id= 3;
UPDATE user SET profile_image_url = "https://res.cloudinary.com/dwlftsdge/image/upload/v1622897468/Instagram%20App/Nature%20images/profile%20images/5348112_z2dsas.jpg" WHERE user_id= 4;
UPDATE user SET profile_image_url = "https://res.cloudinary.com/dwlftsdge/image/upload/v1622897469/Instagram%20App/Nature%20images/profile%20images/20424727_gknl6n.jpg" WHERE user_id= 5;
UPDATE user SET profile_image_url = "https://res.cloudinary.com/dwlftsdge/image/upload/v1622897470/Instagram%20App/Nature%20images/profile%20images/asian-woman-posing-looking-camera_ely70t.jpg" WHERE user_id= 6;

UPDATE post SET post_url = "https://res.cloudinary.com/dwlftsdge/image/upload/v1620653958/Instagram%20App/Nature%20images/post-image_trxquf.jpg" WHERE post_id= 0;
UPDATE post SET post_url = "https://res.cloudinary.com/dwlftsdge/image/upload/v1622808296/Instagram%20App/Nature%20images/pexels-pixabay-206359_h43iaz.jpg" WHERE post_id= 1;
UPDATE post SET post_url = "https://res.cloudinary.com/dwlftsdge/image/upload/v1622808297/Instagram%20App/Nature%20images/pexels-james-wheeler-417074_yuejz9.jpg" WHERE post_id= 2;
UPDATE post SET post_url = "https://res.cloudinary.com/dwlftsdge/image/upload/v1622808297/Instagram%20App/Nature%20images/pexels-snapwire-6992_xvsxeh.jpg" WHERE post_id= 3;
UPDATE post SET post_url = "https://res.cloudinary.com/dwlftsdge/image/upload/v1622905198/Instagram%20App/Nature%20images/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807_bsy9oe.jpg" WHERE post_id= 4;
UPDATE post SET post_url = "https://res.cloudinary.com/dwlftsdge/image/upload/v1622887344/Instagram%20App/Nature%20images/104_bathroom_fyqmo9.jpg" WHERE post_id= 5;
UPDATE post SET post_url = "https://res.cloudinary.com/dwlftsdge/image/upload/v1622887345/Instagram%20App/Nature%20images/102_frontal_qdte1p.jpg" WHERE post_id= 6;
UPDATE post SET post_url = "https://res.cloudinary.com/dwlftsdge/image/upload/v1622887345/Instagram%20App/Nature%20images/101_kitchen_zt669h.jpg" WHERE post_id= 7;
UPDATE post SET post_url = "https://res.cloudinary.com/dwlftsdge/image/upload/v1622905329/Instagram%20App/Nature%20images/beautiful-modern-house-nature-environment_33799-4384_jw85f5.jpg" WHERE post_id= 8;
UPDATE post SET post_url = "https://res.cloudinary.com/dwlftsdge/image/upload/v1622905329/Instagram%20App/Nature%20images/view-photography-concrete-brick-houses_249578-126_aadytq.jpg" WHERE post_id= 9;
UPDATE post SET post_url = "https://res.cloudinary.com/dwlftsdge/image/upload/v1622887742/Instagram%20App/Nature%20images/xm25-counter-defilade-engagement-system-001_vgnqhf.jpg" WHERE post_id= 10;
UPDATE post SET post_url = "https://res.cloudinary.com/dwlftsdge/image/upload/v1622887743/Instagram%20App/Nature%20images/maxresdefault_jjqpxs.jpg" WHERE post_id= 11;
UPDATE post SET post_url = "https://res.cloudinary.com/dwlftsdge/image/upload/v1622887743/Instagram%20App/Nature%20images/699855-defence-afp-070218_g071oh.jpg" WHERE post_id= 12;
UPDATE post SET post_url = "https://res.cloudinary.com/dwlftsdge/image/upload/v1622907481/Instagram%20App/Nature%20images/white-modern-sport-car-parking-road_114579-4025_p4n1lg.jpg" WHERE post_id= 13;
UPDATE post SET post_url = "https://res.cloudinary.com/dwlftsdge/image/upload/v1622907481/Instagram%20App/Nature%20images/blue-sport-sedan-parked-yard_114579-5078_fwbhld.jpg" WHERE post_id= 14;
UPDATE post SET post_url = "https://res.cloudinary.com/dwlftsdge/image/upload/v1622907481/Instagram%20App/Nature%20images/red-luxury-sedan-road_114579-5079_fkwvzv.jpg" WHERE post_id= 15;
UPDATE post SET post_url = "https://res.cloudinary.com/dwlftsdge/image/upload/v1622907681/Instagram%20App/Nature%20images/paris-city-landscape-france-eiffel-tower_49537-226_l2nzno.jpg" WHERE post_id= 16;
UPDATE post SET post_url = "https://res.cloudinary.com/dwlftsdge/image/upload/v1622907681/Instagram%20App/Nature%20images/beautiful-purple-woman-surrounded-by-nature-illustration_53876-97561_d5rysn.jpg" WHERE post_id= 17;
UPDATE post SET post_url = "https://res.cloudinary.com/dwlftsdge/image/upload/v1622907681/Instagram%20App/Nature%20images/conceptual-art-representing-quiet-mind-chaos-vector-illustration_1196-897_xnz1xk.jpg" WHERE post_id= 18;
UPDATE post SET post_url = "https://res.cloudinary.com/dwlftsdge/image/upload/v1622887822/Instagram%20App/Nature%20images/istockphoto-1177116437-612x612_vzleo6.jpg" WHERE post_id= 19;
UPDATE post SET post_url = "https://res.cloudinary.com/dwlftsdge/image/upload/v1622887822/Instagram%20App/Nature%20images/0132_637324252136928732_agcaf9.jpg" WHERE post_id= 21;

ALTER TABLE user

INSERT INTO user(pet_name) VALUES('ramram') WHERE user_id=1;
UPDATE user SET pet_name = 'krishna' WHERE user_id=2;
UPDATE user SET pet_name = 'lalli' WHERE user_id=3;
UPDATE user SET pet_name = 'megha' WHERE user_id=4;
UPDATE user SET pet_name = 'madhu' WHERE user_id=5;
UPDATE user SET pet_name = 'kavya' WHERE user_id=6;
UPDATE user SET pet_name = 'ramram' WHERE user_id=1;


insert into post_likes (id, post_id, user_id, liked, liked_time) values (1, 0, 1, true, '2021-05-08 18:53:54');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (2, 0, 2, true, '2021-03-20 08:16:31');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (3, 0, 3, true, '2021-03-24 20:10:59');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (4, 0, 4, true, '2021-03-18 08:48:42');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (5, 0, 5, true, '2021-03-09 12:27:31');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (6, 1, 2, true, '2021-04-23 04:45:30');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (7, 1, 3, true, '2021-05-07 13:23:09');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (8, 1, 4, true, '2021-04-29 12:18:04');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (9, 1, 5, true, '2021-04-14 09:27:34');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (10, 2, 1, true, '2021-04-12 04:38:50');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (11, 2, 2, true, '2021-04-03 04:43:11');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (12, 2, 3, true, '2021-03-27 12:16:03');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (13, 3, 1, true, '2021-04-20 07:35:32');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (14, 3, 2, true, '2021-03-22 17:10:05');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (15, 3, 3, true, '2021-03-13 05:58:13');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (16, 3, 4, true, '2021-04-30 06:21:47');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (17, 3, 5, true, '2021-03-26 15:46:31');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (18, 4, 4, true, '2021-05-05 07:01:08');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (19, 4, 5, true, '2021-04-22 03:22:24');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (20, 4, 6, true, '2021-04-12 02:48:28');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (21, 5, 6, true, '2021-04-14 12:37:38');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (22, 5, 5, true, '2021-05-01 08:19:22');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (23, 5, 4, true, '2021-04-20 17:52:27');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (24, 5, 3, true, '2021-04-12 10:02:56');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (25, 5, 2, true, '2021-03-26 16:32:44');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (26, 6, 1, true, '2021-05-07 16:34:14');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (27, 6, 2, true, '2021-04-24 14:15:14');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (28, 6, 3, true, '2021-04-14 13:05:35');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (29, 7, 4, true, '2021-04-13 08:50:50');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (30, 7, 5, true, '2021-04-13 14:56:34');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (31, 7, 6, true, '2021-04-06 10:20:25');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (32, 7, 3, true, '2021-04-19 06:00:02');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (33, 7, 2, true, '2021-03-24 21:45:34');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (34, 8, 1, true, '2021-04-06 20:45:22');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (35, 8, 2, true, '2021-04-23 01:43:51');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (36, 9, 3, true, '2021-03-22 20:54:21');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (37, 9, 4, true, '2021-04-18 11:24:44');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (38, 9, 5, true, '2021-04-13 04:40:29');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (39, 9, 6, true, '2021-05-07 02:22:59');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (40, 10, 4, true, '2021-04-08 20:58:59');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (41, 10, 5, true, '2021-03-26 00:24:25');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (42, 10, 6, true, '2021-03-21 09:54:54');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (43, 10, 3, true, '2021-03-27 05:12:39');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (44, 10, 1, true, '2021-04-09 16:14:00');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (45, 11, 2, true, '2021-03-30 12:32:02');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (46, 11, 3, true, '2021-04-09 03:04:33');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (47, 11, 4, true, '2021-03-20 16:09:09');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (48, 12, 5, true, '2021-03-22 00:02:10');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (49, 12, 6, true, '2021-03-22 16:29:10');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (50, 12, 1, true, '2021-04-12 22:20:59');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (51, 13, 2, true, '2021-03-21 06:52:05');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (52, 13, 3, true, '2021-04-25 18:11:43');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (53, 13, 4, true, '2021-03-30 00:59:44');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (54, 13, 1, true, '2021-04-27 12:51:51');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (55, 14, 6, true, '2021-04-17 19:30:27');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (56, 14, 5, true, '2021-03-08 12:19:45');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (57, 14, 4, true, '2021-05-06 00:53:12');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (58, 14, 3, true, '2021-03-27 18:38:04');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (59, 14, 2, true, '2021-04-25 22:29:51');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (60, 15, 1, true, '2021-04-25 06:16:09');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (61, 16, 2, true, '2021-04-15 18:29:22');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (62, 16, 3, true, '2021-04-19 20:08:01');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (63, 17, 4, true, '2021-04-14 17:24:56');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (64, 17, 5, true, '2021-05-07 01:50:09');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (65, 17, 6, true, '2021-05-02 09:50:29');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (66, 17, 1, true, '2021-03-16 09:49:12');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (67, 18, 2, true, '2021-05-01 03:58:34');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (68, 18, 3, true, '2021-03-16 01:25:01');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (69, 18, 4, true, '2021-03-20 23:33:55');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (70, 18, 5, true, '2021-05-04 16:49:54');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (71, 18, 6, true, '2021-05-06 13:06:38');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (72, 19, 5, true, '2021-03-25 21:02:35');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (73, 19, 4, true, '2021-04-19 01:17:10');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (74, 19, 3, true, '2021-04-24 11:54:48');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (75, 19, 2, true, '2021-04-14 11:45:45');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (76, 19, 1, true, '2021-04-27 18:48:58');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (77, 20, 4, true, '2021-04-14 12:07:07');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (78, 20, 5, true, '2021-05-02 17:42:44');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (79, 20, 6, true, '2021-04-12 05:30:50');
insert into post_likes (id, post_id, user_id, liked, liked_time) values (80, 20, 3, true, '2021-05-03 20:57:04');

create table post_likes (id INTEGER NOT NULL PRIMARY KEY, post_id INTEGER, user_id INTEGER, liked BOOLEAN, liked_time DATETIME, FOREIGN KEY (post_id) REFERENCES post(post_id) ON DELETE CASCADE, FOREIGN KEY (user_id) REFERENCES user(user_id));

SELECT 
        post.post_id as id,
        user.profile_image_url as friend_profile_image,
        user.full_name as friend_name,
        post.post_created_time as friend_post_time,
        (SELECT full_name FROM user WHERE username='krish123') AS user
    FROM (post 
        JOIN user ON post.user_id = user.user_id) AS T 
        JOIN followers ON followers.following_id = T.user_id
        LEFT JOIN post_likes ON post.post_id = post_likes.post_id
    WHERE followers.follower_id = (
        SELECT user.user_id
        FROM user
        WHERE user.username = 'krish123') 
    GROUP BY post.post_id
    ORDER BY post.post_created_time DESC;

    CREATE TABLE saved_posts(
        id INTEGER NOT NULL PRIMARY KEY, 
        post_id INTEGER, 
        user_id INTEGER, 
        saved_time DATETIME, 
        FOREIGN KEY (post_id) REFERENCES post(post_id) ON DELETE CASCADE, 
        FOREIGN KEY (user_id) REFERENCES user(user_id)
    );