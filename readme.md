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

- [API Documentation (Swagger UI)](http://localhost:8082/swagger-ui.html)

This Swagger UI provides an interactive interface where you can explore and test all the available endpoints for each microservice. It includes details on the request/response formats, parameters, and possible responses.

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

## How to Run the Project

1. **Clone the repository**:
   ```bash
   git clone --recurse-submodules https://github.com/MrCadavid/microservices.git
   cd microservices
   ```

## How to Run the Project with Docker Compose

### Option 1: Run with Docker Compose

This project includes a `docker-compose.yml` file to easily run all the microservices using Docker. To start the services using Docker Compose, follow these steps:

1. **Ensure Docker and Docker Compose are installed** on your machine.

2. **Build and run the services** with Docker Compose:
   ```bash
   docker-compose up --build
   ```

   This command will:
   - Build the Docker images for the microservices.
   - Start the containers for each microservice (Eureka, API Gateway, Event Service, and Notification Service).

3. **Access the services**:
   - **Eureka (Service Registry)**: `http://localhost:8761`
   - **API Gateway**: `http://localhost:8082`
   - **Event Service**: `http://localhost:8080`
   - **Notification Service**: `http://localhost:8081`

### Option 2: Run Individually (Without Docker Compose)

If you prefer to run each service individually, make sure to start the services in the following order:
1. **Eureka Service** on port 8761
2. **Event Service** on port 8080
3. **Notification Service** on port 8081
4. **API Gateway** on port 8082

## Stopping the Services

To stop the services running with Docker Compose, use the following command:

```bash
docker-compose down
```

This will stop and remove all the containers.
