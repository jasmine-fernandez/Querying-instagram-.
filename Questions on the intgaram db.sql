-- FINDING THE FIVE OLDEST USERS 
SELECT * 
FROM users
ORDER BY created_at
LIMIT 5;

-- WHAT DAY OF THE WEEK DO MOST USERS REGISTER ON?
SELECT  DAYNAME(created_at),COUNT(username)
FROM USERS
GROUP BY DAYNAME(created_at);

-- Identify Inactive users who have never posted a photo (possible bots)
select username from users left join photos on photos.user_id=users.id where image_url is null;

-- MOST LIKED PHOTO by which user 

SELECT photos.user_id,username,photo_id,count(likes.user_id) 
from likes
join photos on photos.id=likes.photo_id
join users on users.id=photos.user_id
group by photo_id
order by count(likes.user_id) desc
limit 1;

-- What are engagement is like. How many times does the avergae user post.
-- i.e. total number of posts/total number of users
SELECT (SELECT COUNT(*) FROM photos )/ (SELECT COUNT(*) from users);

-- What are the top 5 most commonly used hashtags 
SELECT tag_id,tag_name,count(photo_id) 
FROM photo_tags
join tags on tags.id=photo_tags.tag_id
group by tag_id order by count(photo_id) desc
limit 5;

-- users who have liked every single photo on the website
select username,user_id,count(*) as total_likes from users 
inner join likes  on users.id=likes.user_id
group by likes.user_id
HAVING total_likes=(SELECT COUNT(*) FROM photos);