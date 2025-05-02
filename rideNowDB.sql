CREATE TABLE Admin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE Cab (
    id INT AUTO_INCREMENT PRIMARY KEY,
    register_no VARCHAR(255) UNIQUE NOT NULL,
    seating_capacity VARCHAR(255) NOT NULL,
    color VARCHAR(255),
    model VARCHAR(255) NOT NULL,
    driver_id INT,
    FOREIGN KEY (driver_id) REFERENCES Driver(id)
);

CREATE TABLE Customer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE Driver (
    id INT AUTO_INCREMENT PRIMARY KEY,
    drivers_license VARCHAR(255) UNIQUE NOT NULL,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE DriverOperation (
    id INT AUTO_INCREMENT PRIMARY KEY,
    startTime TIME,
    endTime TIME,
    cab_status ENUM('AVAILABLE', 'HIRED') DEFAULT 'AVAILABLE',
    driver_id INT NOT NULL UNIQUE,
    cab_id INT NOT NULL UNIQUE,
    FOREIGN KEY (driver_id) REFERENCES Driver(id),
    FOREIGN KEY (cab_id) REFERENCES Cab(id)
);

CREATE TABLE Payment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    payment_type ENUM('CASH', 'ONLINE') NOT NULL,
    payment_status ENUM('Pending', 'Paid') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ride_id INT,
    FOREIGN KEY (ride_id) REFERENCES Ride(id)
);

CREATE TABLE Ride (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pickup_location VARCHAR(255) NOT NULL,
    pickup_name VARCHAR(255) NOT NULL,
    drop_location VARCHAR(255) NOT NULL,
    drop_name VARCHAR(255) NOT NULL,
    rating INT,
    fare INT DEFAULT 0,
    distance VARCHAR(255),
    duration VARCHAR(255),
    payment_type ENUM('CASH', 'ONLINE'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    customer_id INT,
    cab_id INT,
    driver_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (cab_id) REFERENCES Cab(id),
    FOREIGN KEY (driver_id) REFERENCES Driver(id)
);

CREATE TABLE RideRequest (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pickup_location VARCHAR(255),
    pickup_name VARCHAR(255),
    drop_location VARCHAR(255),
    drop_name VARCHAR(255),
    distance VARCHAR(255),
    duration VARCHAR(255),
    fare INT,
    payment_type ENUM('CASH', 'ONLINE'),
    seating_capacity ENUM('FIVE_SEATER', 'SEVEN_SEATER'),
    booking_status ENUM('PENDING', 'ACCEPTED'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    customer_id INT,
    ride_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (ride_id) REFERENCES Ride(id)
);

CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone_no VARCHAR(255) UNIQUE NOT NULL,
    address VARCHAR(255) NOT NULL,
    role ENUM('ADMIN', 'DRIVER', 'CUSTOMER'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Enum Types for BookingStatus, CabStatus, PaymentStatus, PaymentType, Role, SeatingCapacity

-- BookingStatus Enum
CREATE TABLE BookingStatus (
    id INT AUTO_INCREMENT PRIMARY KEY,
    status ENUM('PENDING', 'ACCEPTED') NOT NULL
);

-- CabStatus Enum
CREATE TABLE CabStatus (
    id INT AUTO_INCREMENT PRIMARY KEY,
    status ENUM('AVAILABLE', 'HIRED') NOT NULL
);

-- PaymentStatus Enum
CREATE TABLE PaymentStatus (
    id INT AUTO_INCREMENT PRIMARY KEY,
    status ENUM('Pending', 'Paid') NOT NULL
);

-- PaymentType Enum
CREATE TABLE PaymentType (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type ENUM('CASH', 'ONLINE') NOT NULL
);

-- FarePrice Enum
CREATE TABLE FarePrice (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type ENUM('FIVE_SEATER', 'SEVEN_SEATER') NOT NULL,
    ratePerKm DECIMAL(10, 2) NOT NULL3306
);

-- SeatingCapacity Enum
CREATE TABLE SeatingCapacity (
    id INT AUTO_INCREMENT PRIMARY KEY,
    capacity ENUM('FIVE_SEATER', 'SEVEN_SEATER') NOT NULL
);
