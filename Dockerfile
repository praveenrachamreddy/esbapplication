# Use a base image with a JDK suitable for running your Quarkus application
FROM adoptopenjdk:17-jdk-hotspot

# Set the working directory inside the container
WORKDIR /app

# Copy the Quarkus application runner JAR into the container
COPY target/quarkus-camel-poc-1.0.0-SNAPSHOT-runner.jar /app/quarkus-camel-poc-1.0.0-SNAPSHOT-runner.jar

# Expose the port that your Quarkus application listens on (if applicable)
EXPOSE 8080

# Specify the command to run your Quarkus application
CMD ["java", "-jar", "quarkus-camel-poc-1.0.0-SNAPSHOT-runner"]
