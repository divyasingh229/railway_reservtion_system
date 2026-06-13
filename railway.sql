-- Railway Reservation System Database
CREATE DATABASE IF NOT EXISTS railway;
USE railway;

-- Passenger Table
CREATE TABLE Passenger(
  PassengerID INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(100) NOT NULL,
  Email VARCHAR(100),
  Phone VARCHAR(15),
  Age INT,
  Gender VARCHAR(10),
  Address VARCHAR(255),
  CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Train Table
CREATE TABLE Train(
  TrainID INT PRIMARY KEY AUTO_INCREMENT,
  TrainName VARCHAR(100) NOT NULL,
  Source VARCHAR(50) NOT NULL,
  Destination VARCHAR(50) NOT NULL,
  TotalSeats INT DEFAULT 0,
  AvailableSeats INT DEFAULT 0,
  DepartureTime TIME,
  ArrivalTime TIME,
  Status VARCHAR(20) DEFAULT 'Active'
);

-- Reservation Table
CREATE TABLE Reservation(
  ReservationID INT PRIMARY KEY AUTO_INCREMENT,
  PassengerID INT NOT NULL,
  TrainID INT NOT NULL,
  ReservationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  JourneyDate DATE,
  Status VARCHAR(20) DEFAULT 'Confirmed',
  Fare INT,
  FOREIGN KEY(PassengerID) REFERENCES Passenger(PassengerID),
  FOREIGN KEY(TrainID) REFERENCES Train(TrainID)
);

-- Booking Table
CREATE TABLE Booking(
  BookingID INT PRIMARY KEY AUTO_INCREMENT,
  ReservationID INT NOT NULL,
  BookingDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PaymentMethod VARCHAR(50),
  Amount INT,
  Status VARCHAR(20) DEFAULT 'Confirmed',
  FOREIGN KEY(ReservationID) REFERENCES Reservation(ReservationID)
);

-- Cancellation Table
CREATE TABLE Cancellation(
  CancelID INT PRIMARY KEY AUTO_INCREMENT,
  ReservationID INT NOT NULL,
  CancellationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  Reason VARCHAR(255),
  RefundAmount INT,
  Status VARCHAR(20) DEFAULT 'Pending',
  FOREIGN KEY(ReservationID) REFERENCES Reservation(ReservationID)
);

-- Insert Sample Data

-- Sample Passengers
INSERT INTO Passenger(Name, Email, Phone, Age, Gender, Address) VALUES
('Rahul Sharma', 'rahul@gmail.com', '9876543210', 25, 'Male', 'Bangalore'),
('Priya Singh', 'priya@gmail.com', '9876543211', 30, 'Female', 'Delhi'),
('Arjun Patel', 'arjun@gmail.com', '9876543212', 28, 'Male', 'Mumbai'),
('Divya Kumar', 'divya@gmail.com', '9876543213', 26, 'Female', 'Pune');

-- Sample Trains
INSERT INTO Train(TrainName, Source, Destination, TotalSeats, AvailableSeats, DepartureTime, ArrivalTime, Status) VALUES
('Vande Bharat', 'Bangalore', 'Chennai', 250, 150, '06:00:00', '10:00:00', 'Active'),
('Shatabdi Express', 'Bangalore', 'Mysore', 200, 120, '08:00:00', '11:00:00', 'Active'),
('Jan Shatabdi', 'Hubli', 'Belagavi', 180, 100, '07:00:00', '10:30:00', 'Active'),
('Mysore Express', 'Bangalore', 'Mysore', 220, 140, '09:00:00', '12:00:00', 'Active');

-- Sample Reservations
INSERT INTO Reservation(PassengerID, TrainID, JourneyDate, Status, Fare) VALUES
(1, 1, '2024-07-15', 'Confirmed', 1200),
(2, 2, '2024-07-16', 'Confirmed', 850),
(3, 4, '2024-07-17', 'Confirmed', 950),
(4, 3, '2024-07-18', 'Cancelled', 720);

-- Sample Bookings
INSERT INTO Booking(ReservationID, PaymentMethod, Amount, Status) VALUES
(1, 'Credit Card', 1200, 'Confirmed'),
(2, 'Debit Card', 850, 'Confirmed'),
(3, 'UPI', 950, 'Confirmed');

-- Sample Cancellations
INSERT INTO Cancellation(ReservationID, Reason, RefundAmount, Status) VALUES
(4, 'Personal Reason', 680, 'Processed');

-- Indexes for Performance
CREATE INDEX idx_passenger_id ON Reservation(PassengerID);
CREATE INDEX idx_train_id ON Reservation(TrainID);
CREATE INDEX idx_reservation_id ON Booking(ReservationID);
CREATE INDEX idx_cancel_reservation ON Cancellation(ReservationID);
