CREATE DATABASE lorde_forum;

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT,
    post_text VARCHAR,
    image_url TEXT,
    video_url TEXT,
    created_at TIMESTAMP

);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT,
    email TEXT,
    password_digest TEXT

);

INSERT INTO posts (title, post_text, image_url, video_url) VALUES ('First Lorde post','This dream isn''t feeling sweet','https://64.media.tumblr.com/a42b053ebd122359e707e20feff7c344/tumblr_p6boguovmA1wbrp3so1_1280.png','https://youtu.be/4bNZK-zgmUc');

ALTER TABLE posts ADD COLUMN user_id INTEGER;