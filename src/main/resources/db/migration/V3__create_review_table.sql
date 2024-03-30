CREATE TABLE review (
    id SERIAL PRIMARY KEY,
    product_id INT,
    user_id INT,
    rating NUMERIC(3, 2),
    comment TEXT,
    review_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(id)
);