#!/bin/bash

# Database and file configuration
DB_NAME1="events"       # First database
DB_NAME2="notifications"      # Second database
USER="postgres"                  # PostgreSQL user
FILE1="events.sql"               # First SQL file
FILE2="notifications.sql"        # Second SQL file

# Function to create the database if it doesn't exist and load the SQL file
load_database() {
  DB_NAME=$1
  FILE=$2

  echo "Creating the database $DB_NAME..."
  sudo -u $USER createdb $DB_NAME

  # Load the SQL file into the database
  echo "Loading the file $FILE into the database $DB_NAME..."
  sudo -u $USER psql $DB_NAME < $FILE

  # Success confirmation
  echo "File $FILE successfully loaded into the database $DB_NAME."
}

# Load the first database
load_database $DB_NAME1 $FILE1

# Load the second database
load_database $DB_NAME2 $FILE2

echo "All files have been successfully loaded."
