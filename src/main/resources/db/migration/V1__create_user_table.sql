create table users(
    id serial primary key,
    name varchar(255),
    github_id TEXT UNIQUE,
    avatar text
);