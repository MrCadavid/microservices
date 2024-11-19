-- Create database
CREATE DATABASE event_schedule;

-- Select the database to work with
\c event_schedule;

-- Create users table (facilitators, administrators, and citizens)
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    role VARCHAR(50) NOT NULL CHECK (role IN ('facilitator', 'administrator', 'citizen')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create events table
CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    event_type VARCHAR(255) NOT NULL,
    organizer_id INT NOT NULL,
    event_date TIMESTAMP NOT NULL,
    location VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (organizer_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Create notifications table
CREATE TABLE notifications (
    id SERIAL PRIMARY KEY,
    event_id INT NOT NULL,
    message TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (event_id) REFERENCES events(id) ON DELETE CASCADE
);

-- Insert sample users
INSERT INTO users (name, email, role) VALUES
('John Doe', 'john@example.com', 'facilitator'),
('Mary Smith', 'mary@example.com', 'administrator'),
('Carlos Gomez', 'carlos@example.com', 'citizen'),
('Anna Johnson', 'anna@example.com', 'citizen');

-- Insert sample events
INSERT INTO events (event_type, organizer_id, event_date, location) VALUES
('Concert', 1, '2024-11-25 18:00:00', 'Main Auditorium'),
('Tech Workshop', 1, '2024-11-27 10:00:00', 'Conference Room A'),
('Cleanup Day', 1, '2024-11-30 08:00:00', 'Main Park');

-- Insert sample notifications
INSERT INTO notifications (event_id, message) VALUES
(1, 'Dont miss the concert this Friday at 6 PM in the Main Auditorium. See you there!'),
(2, 'Join us for the Tech Workshop this Wednesday at 10 AM in Conference Room A. Register now!');

-- Show the structure of the tables
SELECT * FROM users;
SELECT * FROM events;
SELECT * FROM notifications;
