use ig_clone;
#1 Five oldest user on instagram from provided database
SELECT 
    username, id, created_at
FROM
    users
ORDER BY created_at ASC
LIMIT 5;

#2 users who never posted a single photo
SELECT 
    u.username
FROM
    users AS u
        LEFT JOIN
    photos AS p ON p.user_id = u.id
WHERE
    p.image_url IS NULL
ORDER BY u.username;

#3 winner with the most likes
select * from likes,photos,users;
select l.photo_id,users.username,count(l.user_id) as no_of_likes
from likes as l inner join photos on l.photo_id=photos.id
inner join users on photos.user_id=users.id group by l.photo_id,users.username
order by no_of_likes desc limit 1;

#4 top 5 most commonly used hashtags 
select  * from tags,photo_tags;
select t.tag_name,count(*) as hashtag from photo_tags as p  join tags as t on t.id=p.tag_id
group by t.id order by hashtag desc limit  5; 

#5 best day of the week to launch adds
select * from users;
select dayname(created_at)as best_day,count(username) from users 
group by best_day
order by count(username) desc  ;


#6 average number of photos on instagram and total number of photos divided by total number of users
SELECT 
    *
FROM
    photos,
    users;
with user_engagement as(
select u.id as userid,count(p.id)as photoid from users as u left join photos as p on p.user_id=u.id group by u.id)
select sum(photoid)as total_photos,  count(userid) as total_users,sum(photoid)/count(userid)as photo_per_user , sum(photoid)/sum(userid)as total_avg_photos
from user_engagement;


#7 users who liked every single photo  on the site
select * from users,likes;
with fake_account as(
select u.username,count(l.photo_id) as likes from likes as l inner join users as u on u.id=l.user_id
group by u.username)
select username ,likes from fake_account where likes=(select count(*)from photos) order by username;



























     