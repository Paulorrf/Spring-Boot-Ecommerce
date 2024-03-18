CREATE TABLE product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price NUMERIC(10, 2) NOT NULL,
    quantity INTEGER NOT NULL,
    category_id BIGINT,
    image VARCHAR(255),
    review_id BIGINT,
    rating NUMERIC(3, 2),
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (review_id) REFERENCES review(id)
);