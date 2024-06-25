# Use the OpenJDK 17 base image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file into the container
COPY quarkus-run.jar /app/quarkus-run.jar

# Expose the port the application runs on (replace with your actual port if different)
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "quarkus-run.jar"]
