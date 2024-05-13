CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    username varchar(255) UNIQUE NOT NULL,
    github_id TEXT UNIQUE,
    avatar TEXT
);