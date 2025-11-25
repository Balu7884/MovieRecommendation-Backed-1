# =========
# 1) BUILD STAGE
# =========
FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app

# Cache dependencies
COPY pom.xml .
RUN mvn -B dependency:go-offline

# Build the app
COPY src ./src
RUN mvn -B clean package -DskipTests


# =========
# 2) RUNTIME STAGE
# =========
FROM eclipse-temurin:17-jre

WORKDIR /app

# Expose application port
EXPOSE 8080

# Copy built jar
COPY --from=build /app/target/*.jar app.jar

# DO NOT ADD ENV VARIABLES HERE — THEY COME FROM ZEABUR UI

# Start the application
ENTRYPOINT ["java", "-jar", "app.jar"]
