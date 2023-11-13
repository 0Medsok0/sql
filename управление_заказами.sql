-- Создание таблицы заказов
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    history TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Создание таблицы клиентов
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- Добавление заказа
INSERT INTO orders (customer_id, order_date, status, history)
VALUES (1, '2022-01-01', 'Новый', '');

-- Обновление статуса заказа
UPDATE orders
SET status = 'Выполнен'
WHERE id = 1;

-- Удаление заказа
DELETE FROM orders
WHERE id = 1;
