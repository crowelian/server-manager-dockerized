# Dockerize Server Monitor
Dockerize this:
https://github.com/crowelian/server-manager


## Notes
- Java 9 needed: openjdk9-jre

## Todos
- add env variables for ports

## Usage
1. copy the jar packaged file to java folder
    - rename the jar file to: backend-spring-boot.jar
2. copy the built Angular files to html folder
3. create Postgres server docker container
    - login to postgres
    - create a database called: postgresservers
    - login to database
    - create table server
    - with rows:
```sql
CREATE TABLE server (
  id bigint NOT NULL,
  image_url character varying(255),
  ip_address character varying(255),
  memory character varying(255),
  name character varying(255),
  status integer,
  type character varying(255),
  PRIMARY KEY (id)
);
```

    - OR run the java file with spring.jpa.hibernate.ddl-auto= create
    - check the postgres container ip:
```bash
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <NAME-OF-CONTAINER>
#example:
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' postgres-auth-db
```
    - add the ip to the Docker file after "# HERE FILL THE CORRECT IP:"
    - eg. --spring.datasource.url=jdbc:postgresql://172.17.0.2:5432/postgresservers

## build and run

build:
```bash
docker build -t server-monitor-image:v1 .
```

## run the docker container
*frontend port 4200,3000 or 4230 and backend 8080*

run:
```bash
# usually angular uses 4200
docker run --name server-monitor -d -p 4200:80 -p 8080:8080 server-monitor-image:v1
# or usually react
docker run --name server-monitor -d -p 3000:80 -p 8080:8080 server-monitor-image:v1
# or for html
docker run --name server-monitor -d -p 4230:80 -p 8080:8080 server-monitor-image:v1
```

