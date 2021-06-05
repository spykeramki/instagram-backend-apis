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
