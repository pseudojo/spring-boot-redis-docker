Demo: Spring Boot - Redis - Docker
==================================

This is a small demo project of *building and running* a Spring Boot application and some 
additional services in Docker containers. It should be relatively easy to adapt the
structure to other similar architectures.

1. *Build environment:*  The `build-backend.sh` script uses the [official Docker image for Gradle](https://hub.docker.com/_/gradle) 
to build the backend code.

2. *Development runtime environment:* Built using [Docker Compose](https://docs.docker.com/compose/).
The multi-container setup runs the following containers:
    * Backend container using the [official Docker image for OpenJDK](https://hub.docker.com/_/openjdk).
      Exposes the port `8080` to the host.
    * Redis container using the [official Docker image for Redis](https://hub.docker.com/_/redis)


Requirements
------------

This project requires only Docker and Docker Compose, as it is compiled and run in containers.


Building and Running
--------------------

First build the backend:

    ./build-backend.sh

Build containers and run:

    docker-compose up

Verify that the app answers at <http://localhost:8080/users/123>.


Running in the Background
-------------------------

Start detached:

    docker-compose up -d

List containers:

    docker container ls

Run Redis CLI:

    docker exec -it spring-boot-redis-docker_redis_1 redis-cli

Stop containers:

    docker-compose down


Test
-------------------------
```
# Spring boot cURL Test
## Example : curl http://localhost:8080/users/<id>
## <id> is Integer or Long type Number
curl http://localhost:8080/users/131000001

# Get redis key and values
docker exec -it springbootredisdocker_redis_1 redis-cli

# Write command into redis-cli
127.0.0.1:6379> keys *
1) "users::123"
2) "users::12"
3) "users::12314"
4) "users::131000001"
127.0.0.1:6379> get users::131000001
"\xac\xed\x00\x05sr\x00\x1bcom.example.demo.model.User\xff\x1c]\xa8\xa3\t\x13\a\x02\x00\x02J\x00\x02idL\x00\x04namet\x00\x12Ljava/lang/String;xp\x00\x00\x00\x00\a\xce\xe6\xc1t\x00\x0eUser 131000001"
127.0.0.1:6379>

```


