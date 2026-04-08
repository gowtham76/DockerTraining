# -------- Stage 1: Build --------
FROM maven:3.9.9-eclipse-temurin-17 AS builder

WORKDIR /build

# Copy pom and download dependencies first (cache optimization)
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy source code
COPY src ./src

# Build jar
RUN mvn clean package -DskipTests

# -------- Stage 2: Run --------
FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

# Copy only built jar from builder stage
COPY --from=builder /build/target/*.jar app.jar

# Expose your port
EXPOSE 8091

# Run app
ENTRYPOINT ["java","-jar","app.jar","--server.port=8091"]