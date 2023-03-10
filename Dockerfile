# Base image
FROM nginx:alpine

# Configure the nginx
# COPY nginx.conf /etc/nginx/conf.d/default.conf


# Install Java JRE and PostgreSQL
RUN apk add --no-cache openjdk9-jre postgresql postgresql-contrib


# Copy the frontend html
COPY ./html /usr/share/nginx/html


# Copy the java backend
COPY ./java/backend-spring-boot.jar /app/backend-spring-boot.jar

# Expose ports for Java application and Nginx server
EXPOSE 8080 80


# Start the Java application and the nginx
# HERE FILL THE CORRECT IP:
CMD java -jar /app/backend-spring-boot.jar --spring.datasource.url=jdbc:postgresql://172.17.0.2:5432/postgresservers & \
	nginx -g "daemon off;"


