-- Create Database
CREATE DATABASE shopping_db;
USE shopping_db;

-- Customer Table
CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    mobile_number VARCHAR(15) NOT NULL,
    lane VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    pincode VARCHAR(10) NOT NULL
);

-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    section VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

-- Cart Table
CREATE TABLE cart (
    cart_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Payment Table
CREATE TABLE payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    payment_method VARCHAR(20),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- Insert Customers
INSERT INTO customer (first_name, last_name, mobile_number, lane, city, pincode) VALUES
('Riya', 'Dumbare', '9876543210', 'Karve Nagar', 'Pune', '411052'),
('Amit', 'Sharma', '9123456780', 'Andheri', 'Mumbai', '400053');

-- Insert Products
INSERT INTO products (product_name, section, category, price) VALUES
('Formal Shirt', 'men', 'formal', 1500),
('Ethnic Kurti', 'women', 'ethnic', 1200),
('Kids T-shirt', 'kids', 'casual', 500),
('Western Dress', 'women', 'western', 2000),
('Formal Shoes', 'men', 'formal', 2500);

-- Insert Cart
INSERT INTO cart (customer_id, product_id, quantity, total_price) VALUES
(1, 1, 1, 1500),
(2, 4, 2, 4000);

-- Insert Payment
INSERT INTO payment (customer_id, payment_method, status) VALUES
(1, 'UPI', 'Completed'),
(2, 'COD', 'Pending');