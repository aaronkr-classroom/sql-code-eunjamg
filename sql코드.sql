-- Create the Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,  -- Primary Key
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,  -- Ensuring unique email for each customer
    phone_number VARCHAR(15),
    address VARCHAR(200),
    city VARCHAR(100),
    country VARCHAR(50)
);

-- Create the Products table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,  -- Primary Key
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,  -- Price in format XX.XX
    stock_quantity INT NOT NULL,  -- Available quantity in stock
    category VARCHAR(50)
);

-- Create the Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,  -- Primary Key
    customer_id INT,  -- Foreign Key referencing Customers
    order_date DATE NOT NULL,
    shipping_address VARCHAR(200),
    order_status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)  -- Relationship with Customers table
);

-- Create the OrderDetails table
CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY,  -- Primary Key
    order_id INT,  -- Foreign Key referencing Orders
    product_id INT,  -- Foreign Key referencing Products
    quantity INT NOT NULL,  -- Quantity of the product in the order
    price DECIMAL(10, 2) NOT NULL,  -- Price at the time of the order
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),  -- Relationship with Orders table
    FOREIGN KEY (product_id) REFERENCES Products(product_id)  -- Relationship with Products table
);
