# Step 1: Use a Gradle image to build the application.
FROM gradle:8.5.0-jdk21-alpine as build

# Set the working directory in the Docker image.
WORKDIR /app

# Give the gradle user ownership of the working directory.
RUN chown -R gradle:gradle /app

# Switch to the gradle user
USER gradle

# Copy the Gradle build file(s) and source code.
COPY --chown=gradle:gradle . /app/

RUN gradle assemble

# Step 2: Run the built image.
FROM amazoncorretto:21-alpine

# Add a non-root user for running the application (security best practice).
USER 1000

# Set the deployment directory.
WORKDIR /app

# copy jar from build image.
COPY --from=build /app/build/libs/templates-0.0.1.jar /app/demoapp.jar
COPY --from=build /app/run.sh /app/run.sh

EXPOSE 8080
ENTRYPOINT ["sh","/app/run.sh"]

