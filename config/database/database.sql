-- Create the database
CREATE DATABASE event_scheduler;

-- Connect to the created database
\c event_scheduler;

-- Create the user and assign a password
CREATE USER adminevents WITH PASSWORD '673805647e50800f';

-- Grant privileges to the user
GRANT ALL PRIVILEGES ON DATABASE event_scheduler TO adminevents;

-- Create the schema if it does not already exist
CREATE SCHEMA IF NOT EXISTS events_schema;

-- Grant usage and create permissions on the schema to the user
GRANT USAGE, CREATE ON SCHEMA events_schema TO adminevents;

-- Create the 'users' table in the 'events_schema' schema
CREATE TABLE events_schema.users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    role VARCHAR(20) NOT NULL
);

-- Insert data into the 'users' table
INSERT INTO events_schema.users (username, role) VALUES 
    ('guest', 'guest'),
    ('adminuser', 'admin');
