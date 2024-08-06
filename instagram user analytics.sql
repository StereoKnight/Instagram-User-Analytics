use ig_clone;
/* 1 */ SELECT * FROM users ORDER BY created_at limit 5;
/* 2 */ SELECT users.id, username FROM users 
		LEFT JOIN photos ON users.id = photos.user_id 
        WHERE photos.id IS NULL;
/* 3 */ SELECT u.id, username, COUNT(l.photo_id) as total_likes
		FROM likes as l
		INNER JOIN users AS u ON u.id = l.photo_id
		INNER JOIN photos AS p ON p.id = l.photo_id
		GROUP BY p.id ORDER BY total_likes DESC LIMIT 1;
/* 4 */ SELECT tags.id,tags.tag_name, COUNT(tags.tag_name) AS total_occurances FROM TAGS
		INNER JOIN photo_tags on tags.id=photo_tags.tag_id
		group by tags.id order by total_occurances DESC LIMIT 5;

/* 5 */ SELECT dayname(created_at) as name_of_day, count(*) as user_count
		from users
		GROUP BY name_of_day order by user_count desc;

/* 6 */ SELECT (SELECT COUNT(*) FROM photos)/(SELECT COUNT(*) FROM users) as avg_no_of_posts;

select * from photos;
/* 7 */ SELECT users.id,users.username,count(*) AS total_user_likes FROM users 
		join likes ON likes.user_id = users.id 
        GROUP BY likes.user_id Order by total_user_likes desc;