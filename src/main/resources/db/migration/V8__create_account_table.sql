create table account(
    id serial primary key,
    purchases_id INT,
    sales_id INT,
    cart_id INT UNIQUE,
    FOREIGN KEY (purchases_id) REFERENCES purchases(id),
    FOREIGN KEY (sales_id) REFERENCES sales(id),
    FOREIGN KEY (cart_id) REFERENCES cart(id)
);