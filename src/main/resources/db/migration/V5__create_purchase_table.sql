create table purchases(
    id serial primary key,
    quantity INT,
    date_of_purchase DATE,
    product_id INT,
    user_id INT,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);