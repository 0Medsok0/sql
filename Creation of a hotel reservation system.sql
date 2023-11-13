-- Create table for hotels
CREATE TABLE hotels (
    hotel_id INT PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(100),
    country VARCHAR(100),
    rating DECIMAL(2,1)
);

-- Create table for reservations
CREATE TABLE reservations (
    reservation_id INT PRIMARY KEY,
    hotel_id INT,
    guest_name VARCHAR(255),
    checkin_date DATE,
    checkout_date DATE,
    FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id)
);
