-- Create the database
CREATE DATABASE notifications;

-- Connect to the created database
\c notifications;

-- Create the user and assign a password
CREATE USER admin_notifications WITH PASSWORD '673805647e50800f';

-- Create the schema if it does not already exist
CREATE SCHEMA IF NOT EXISTS notifications_schema;

-- Grant privileges to the user
GRANT ALL PRIVILEGES ON DATABASE notifications TO admin_notifications;

-- Create the schema if it does not already exist
CREATE SCHEMA IF NOT EXISTS notifications_schema;

-- Grant usage and create permissions on the schema to the user
GRANT USAGE, CREATE ON SCHEMA notifications_schema TO admin_notifications;


