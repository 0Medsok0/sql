-- система базы данных CRM, для ведения клиентской базы, учета продаж и сделок 

-- Create table for clients
CREATE TABLE clients (
    client_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL
);

-- Create table for sales
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    client_id INT,
    product VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

-- Create table for deals
CREATE TABLE deals (
    deal_id INT PRIMARY KEY,
    client_id INT,
    sale_id INT,
    deal_date DATE NOT NULL,
    deal_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (client_id) REFERENCES clients(client_id),
    FOREIGN KEY (sale_id) REFERENCES sales(sale_id)
);
