# ==========================================================
# Stage 1: Runtime Image for Running the Spring Boot App
# ==========================================================

# Use official lightweight Java 21 image
# This image contains JDK required to run your Spring Boot app
FROM eclipse-temurin:21-jdk-alpine

# Set working directory inside the container
# All commands will run from this folder
WORKDIR /app

# Copy the built Spring Boot jar from your local machine
# into the container and rename it to app.jar for simplicity
#
# IMPORTANT:
# Your jar file is:
# taskmanager-0.0.1-SNAPSHOT.jar
#
# It must exist inside the target/ folder before building image.
COPY target/taskmanager-0.0.1-SNAPSHOT.jar app.jar

# Expose port 8080
# This tells Docker that your application listens on this port
EXPOSE 8080

# Command that runs when the container starts
# It executes your Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]