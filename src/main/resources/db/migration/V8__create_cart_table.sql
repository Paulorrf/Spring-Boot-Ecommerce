create table cart(
    id serial primary key,
    quantity INT,
    date_of_insert DATE,
    product_id INT,
    user_id INT,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);