create table users(
    id serial primary key,
    name varchar(255),
    username varchar(255) UNIQUE NOT NULL,
    github_id TEXT UNIQUE,
    avatar text
);