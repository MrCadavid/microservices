# Microservices with Spring Boot

This project implements a microservice architecture using Spring Boot and several key technologies such as PostgreSQL, RabbitMQ, WebSockets, Eureka (Service Registry), and an API Gateway. The goal is to demonstrate how microservices can interact with each other and provide a scalable and efficient solution.

## Technologies Used
- **Spring Boot**: Main framework for building the microservices.
- **PostgreSQL**: Relational database for storing persistent data.
- **RabbitMQ**: Messaging system for communication between microservices.
- **WebSockets**: Real-time communication for event updates.
- **Eureka**: Service Registry for discovering and registering microservices.
- **API Gateway**: Centralized entry point for all microservices.

## Microservice Description

1. **Event Service**:
   - **Port**: 8080
   - Responsible for managing events and sending notifications to users when certain events occur.

2. **Notification Service**:
   - **Port**: 8081
   - Manages notifications that will be sent to users via various channels (email, SMS, etc.).

3. **Service Registry (Eureka)**:
   - **Port**: 8761
   - Uses Eureka to register and discover the microservices that are part of the system.

4. **API Gateway**:
   - **Port**: 8082
   - A single entry point to the microservices, managing requests and redirecting them to the appropriate services.

## Documentation with OpenAPI and Swagger

The documentation for all the microservices is generated using OpenAPI and Swagger. You can access the API documentation for all the microservices through the API Gateway by visiting the following URL:

- [API Documentation (Swagger UI)](http://whitelink.japaneast.cloudapp.azure.com:8082/swagger-ui.html)

This Swagger UI provides an interactive interface where you can explore and test all the available endpoints for each microservice. It includes details on the request/response formats, parameters, and possible responses.

## Accessing the Event Site

You can access the event site at the following URL:

- [Event Site](http://whitelink.japaneast.cloudapp.azure.com/)

Please note that the site currently does not support HTTPS, but we are planning to implement it soon.

## Prerequisites

Before running the microservices, make sure the following services are deployed and running:

- **PostgreSQL Database**: The database is already deployed. There is no need to run the `config/db/db.sql` script, although the file is available in the repository for reference.
- **RabbitMQ**: The RabbitMQ server is also deployed and operational. The microservices connect to it for event-driven communication.

## Microservice Ports

The microservices will be available on the following ports:

- **Event Service**: `http://localhost:8080`
- **Notification Service**: `http://localhost:8081`
- **Service Registry (Eureka)**: `http://localhost:8761`
- **API Gateway**: `http://localhost:8082`

## How to Run the Project Locally with Docker Compose

To run the project locally using Docker Compose, follow these steps:

### 1. Clone the repository:

```bash
git clone --recurse-submodules https://github.com/MrCadavid/microservices.git
cd microservices
```

### 2. Ensure Docker and Docker Compose are installed on your machine.

You can check if Docker and Docker Compose are installed by running:

```bash
docker --version
docker-compose --version
```

If not installed, follow the [installation guide for Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/) for your operating system.

### 3. Build and run the services with Docker Compose:

In the project directory, run the following command to build and start the services:

```bash
docker-compose up --build
```

This will:
- Build the Docker images for the microservices.
- Start the containers for each microservice (Eureka, API Gateway, Event Service, and Notification Service).

### 4. Access the services:

Once the services are up and running, you can access them using the following URLs (replace `localhost` with the IP or hostname if running on a remote machine):

- **Eureka (Service Registry)**: `http://localhost:8761`
- **API Gateway**: `http://localhost:8082`
- **Event Service**: `http://localhost:8080`
- **Notification Service**: `http://localhost:8081`

Additionally, the Swagger UI documentation can be accessed at:

- [API Documentation (Swagger UI)](http://localhost:8082/swagger-ui.html)

### 5. Stopping the Services

To stop the services running with Docker Compose, use the following command:

```bash
docker-compose down
```

This will stop and remove all the containers.
