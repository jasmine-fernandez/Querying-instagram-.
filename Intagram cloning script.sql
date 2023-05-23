-- Creating a database for the project 
CREATE DATABASE ig_clone;
-- Using the databse created above 
USE ig_clone;
-- Creating a Table called users to store user data
CREATE TABLE users(
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(225) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
    );
-- Creating a Table called photos to shore the data for photos that users upload
CREATE TABLE photos(
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
    );
-- Checking to see the tables we currently have
SHOW TABLES;
-- Creating a Table called comments to store the comments 
CREATE TABLE comments(
id INTEGER AUTO_INCREMENT PRIMARY KEY,
comment_text VARCHAR(255) NOT NULL,
user_id INTEGER NOT NULL,
photo_id INTEGER NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),
FOREIGN KEY (user_id) REFERENCES users(id),
FOREIGN KEY (photo_id) REFERENCES photos(id)
);
-- Checking to see the tables we currently have
SHOW TABLES;
-- Creating a Table called likes to store the data about likes
CREATE TABLE likes(
	user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id,photo_id) -- this helps to create a unique combination and prevents recording multiple enetries for one line 
    );
-- Checking to see the tables we currently have
SHOW TABLES;
-- Creating a Table called follows to store the data about who is following who
CREATE TABLE follows(
follower_id INTEGER NOT NULL,
followee_id INTEGER NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),
FOREIGN KEY(follower_id) REFERENCES users(id),
FOREIGN KEY(followee_id) REFERENCES users(id),
PRIMARY KEY(follower_id,followee_id) -- this helps to ensure that one follower-followee relationship is only recorded once
);
-- Checking to see the tables we currently have
SHOW TABLES;
-- Creating a table called tags for tracking tags 
CREATE TABLE tags (
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(255) UNIQUE,
    creaed_at TIMESTAMP DEFAULT NOW()
);
-- Creating a table called photo_tags for tracking tags for each photo
CREATE TABLE photo_tags (
	photo_id INTEGER NOT NULL,
	tag_id INTEGER NOT NULL,
	FOREIGN KEY(photo_id) REFERENCES photos(id),
	FOREIGN KEY(tag_id) REFERENCES tags(id),
	PRIMARY KEY (photo_id,tag_id)
);
-- Checking to see the tables we currently have
SHOW TABLES;
