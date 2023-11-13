CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255),
  phone_number VARCHAR(20),
  date_of_birth DATE,
  preferences TEXT
);
