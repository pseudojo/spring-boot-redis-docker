FROM openjdk:13-jdk-alpine

RUN mkdir /app

ADD backend/build/libs/demo-0.0.1-SNAPSHOT.jar /app/app.jar

EXPOSE 8080

ENTRYPOINT [ "java", "-jar", "/app/app.jar" ]

