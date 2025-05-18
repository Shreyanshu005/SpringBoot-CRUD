# Use OpenJDK 17 as the base image
FROM openjdk:17-slim

# Set working directory
WORKDIR /app

# Copy the Maven wrapper and pom.xml
COPY .mvn/ .mvn
COPY mvnw pom.xml ./

# Download dependencies
RUN ./mvnw dependency:go-offline

# Copy the source code
COPY src ./src

# Build the application
RUN ./mvnw package -DskipTests

# Expose the port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "target/springboot-crud-0.0.1-SNAPSHOT.jar"] 