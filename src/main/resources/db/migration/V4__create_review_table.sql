CREATE TABLE review (
    id SERIAL PRIMARY KEY,
    product_id BIGINT,
    user_id BIGINT,
    rating NUMERIC(3, 2),
    comment TEXT,
    review_date DATE,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (user_id) REFERENCES user(id)
);