
CREATE TABLE Address (
    address_id SERIAL PRIMARY KEY,
    address VARCHAR(255),
    postcode VARCHAR(20),
    state VARCHAR(50),
    country VARCHAR(50),
    property_valuation INT
);

CREATE TABLE Job_Industry (
    job_industry_id SERIAL PRIMARY KEY,
    job_industry_category VARCHAR(255) UNIQUE
);

CREATE TABLE Customer (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    DOB DATE,
    job_title VARCHAR(100),
    job_industry_id INT REFERENCES Job_Industry(job_industry_id),
    wealth_segment VARCHAR(50),
    deceased_indicator CHAR(1),
    owns_car VARCHAR(3),
    address_id INT REFERENCES Address(address_id)
);

CREATE TABLE Product (
    product_id SERIAL PRIMARY KEY,
    brand VARCHAR(100),
    product_line VARCHAR(100),
    product_class VARCHAR(100),
    product_size VARCHAR(50)
);

CREATE TABLE Transaction (
    transaction_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customer(customer_id),
    product_id INT REFERENCES Product(product_id),
    transaction_date DATE,
    online_order BOOLEAN,
    order_status VARCHAR(50),
    list_price DECIMAL(10,2),
    standard_cost DECIMAL(10,2)
);

-- Заполнение таблицы Job_Industry
INSERT INTO Job_Industry (job_industry_category) VALUES
    ('IT'), ('Finance'), ('Healthcare'), ('Education'), ('Retail'),
    ('Manufacturing'), ('Transportation'), ('Construction'), ('Real Estate'), ('Marketing'),
    ('Entertainment'), ('Legal'), ('Government'), ('Consulting'), ('Energy');


INSERT INTO Product (brand, product_line, product_class, product_size) VALUES
    ('Nike', 'Sportswear', 'Premium', 'L'),
    ('Adidas', 'Casual', 'Standard', 'M'),
    ('Puma', 'Running', 'Premium', 'S'),
    ('Reebok', 'Athletics', 'Standard', 'XL'),
    ('Apple', 'Electronics', 'Premium', 'One Size'),
    ('Samsung', 'Gadgets', 'Standard', 'One Size'),
    ('Sony', 'Home Appliances', 'Premium', 'Large'),
    ('LG', 'TV & Audio', 'Standard', 'Medium'),
    ('Dell', 'Computers', 'Premium', 'One Size'),
    ('HP', 'Computers', 'Standard', 'One Size'),
    ('Lenovo', 'Laptops', 'Standard', 'One Size'),
    ('Canon', 'Cameras', 'Premium', 'One Size'),
    ('Bose', 'Audio', 'Premium', 'Medium'),
    ('Philips', 'Lighting', 'Standard', 'Small'),
    ('Asus', 'Gaming', 'Premium', 'One Size');


INSERT INTO Address (address, postcode, state, country, property_valuation) VALUES
    ('123 Main St', '10001', 'NY', 'USA', 500000),
    ('456 Elm St', '20002', 'DC', 'USA', 600000),
    ('789 Oak St', '30303', 'GA', 'USA', 450000),
    ('101 Pine St', '60606', 'IL', 'USA', 700000),
    ('202 Cedar St', '94107', 'CA', 'USA', 800000),
    ('303 Birch St', '85001', 'AZ', 'USA', 400000),
    ('404 Maple St', '73301', 'TX', 'USA', 550000),
    ('505 Walnut St', '19102', 'PA', 'USA', 650000),
    ('606 Cherry St', '98101', 'WA', 'USA', 500000),
    ('707 Spruce St', '33101', 'FL', 'USA', 750000);


INSERT INTO Customer (first_name, last_name, gender, DOB, job_title, job_industry_id, wealth_segment, deceased_indicator, owns_car, address_id) VALUES
    ('John', 'Doe', 'Male', '1985-05-15', 'Software Engineer', 1, 'Mass Market', 'N', 'Yes', 1),
    ('Jane', 'Smith', 'Female', '1990-07-22', 'Financial Analyst', 2, 'Affluent', 'N', 'No', 2),
    ('Robert', 'Brown', 'Male', '1978-11-10', 'Doctor', 3, 'High Net Worth', 'N', 'Yes', 3),
    ('Emily', 'Davis', 'Female', '1995-03-08', 'Teacher', 4, 'Mass Market', 'N', 'No', 4),
    ('Michael', 'Wilson', 'Male', '1980-09-21', 'Retail Manager', 5, 'Affluent', 'N', 'Yes', 5),
    ('Sarah', 'Miller', 'Female', '1992-12-13', 'Factory Supervisor', 6, 'Mass Market', 'N', 'Yes', 6),
    ('David', 'Anderson', 'Male', '1975-04-25', 'Truck Driver', 7, 'Mass Market', 'N', 'No', 7),
    ('Jessica', 'Thomas', 'Female', '1988-06-30', 'Architect', 8, 'Affluent', 'N', 'Yes', 8),
    ('Daniel', 'Jackson', 'Male', '1993-10-17', 'Real Estate Agent', 9, 'High Net Worth', 'N', 'No', 9),
    ('Laura', 'White', 'Female', '1982-02-14', 'Marketing Specialist', 10, 'Mass Market', 'N', 'Yes', 10);


INSERT INTO Transaction (customer_id, product_id, transaction_date, online_order, order_status, list_price, standard_cost) VALUES
    (1, 1, '2025-01-10', TRUE, 'Completed', 120.00, 80.00),
    (2, 2, '2025-01-12', FALSE, 'Completed', 150.00, 100.00),
    (3, 3, '2025-01-15', TRUE, 'Shipped', 180.00, 120.00),
    (4, 4, '2025-01-20', FALSE, 'Completed', 90.00, 60.00),
    (5, 5, '2025-01-25', TRUE, 'Completed', 1000.00, 750.00),
    (6, 6, '2025-01-28', FALSE, 'Returned', 500.00, 400.00),
    (7, 7, '2025-02-01', TRUE, 'Completed', 200.00, 150.00),
    (8, 8, '2025-02-05', FALSE, 'Shipped', 250.00, 180.00),
    (9, 9, '2025-02-08', TRUE, 'Completed', 700.00, 500.00),
    (10, 10, '2025-02-10', FALSE, 'Completed', 600.00, 450.00),
    (1, 11, '2025-02-12', TRUE, 'Pending', 300.00, 220.00),
    (2, 12, '2025-02-15', FALSE, 'Completed', 400.00, 300.00),
    (3, 13, '2025-02-17', TRUE, 'Completed', 220.00, 180.00),
    (4, 14, '2025-02-18', FALSE, 'Cancelled', 150.00, 100.00),
    (5, 15, '2025-02-20', TRUE, 'Completed', 900.00, 700.00);
