# Use Red Hat's UBI base image with OpenJDK 11
FROM registry.access.redhat.com/ubi8/openjdk-21:1.18

# Set the working directory inside the container
WORKDIR /deployments

# Create necessary directories and set permissions within the container
RUN mkdir -p /deployments \
    && chown -R 185:0 /deployments 
    

# Copy application dependencies and Quarkus executable JAR into the container
COPY --chown=185 target/quarkus-app/lib /deployments/lib
COPY --chown=185 target/quarkus-app/quarkus /deployments/quarkus
COPY --chown=185 target/quarkus-app/app /deployments/app
COPY --chown=185 target/quarkus-app/quarkus-run.jar /deployments/quarkus-run.jar

# Expose the port that your Quarkus application listens on (if applicable)
EXPOSE 8080

# Set user permissions and environment variables
USER 185
ENV JAVA_OPTS_APPEND="-Dquarkus.http.host=0.0.0.0 -Djava.util.logging.manager=org.jboss.logmanager.LogManager"
ENV JAVA_APP_JAR="/deployments/quarkus-run.jar"

# Specify the entry point to run the application using the `run-java.sh` script
ENTRYPOINT [ "/opt/jboss/container/java/run/run-java.sh" ]
