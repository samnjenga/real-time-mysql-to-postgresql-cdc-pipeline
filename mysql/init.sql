CREATE USER IF NOT EXISTS 'debezium'@'%' IDENTIFIED BY 'dbz';
GRANT SELECT, RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT, LOCK TABLES ON *.* TO 'debezium'@'%';
FLUSH PRIVILEGES;

USE appdb;

CREATE TABLE IF NOT EXISTS customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(200) NOT NULL,
    email VARCHAR(255) NOT NULL,
    city VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    product_name VARCHAR(200) NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_orders_customer
      FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO customers (full_name, email, city) VALUES
('Alice Njeri', 'alice@example.com', 'Nairobi'),
('Brian Otieno', 'brian@example.com', 'Kisumu');

INSERT INTO orders (customer_id, product_name, amount, status) VALUES
(1, 'Laptop', 1200.00, 'PENDING'),
(2, 'Phone', 450.00, 'PAID');
