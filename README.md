# Docker Stack Basics

### Build and Test Locally

Build the Docker image

```bash
docker build -t hello-world-app:local .
```

Run the container:

```bash
docker run -p 5000:5000 hello-world-app:local
```

### Run Container from docker stack

This will deploy auto using `docker-compose.yml` file

```bash
docker stack deploy -c docker-compose.yml hello-world
```

This will list each service that is running

```bash
docker service ls
```


This will show all entries of replicas (3) in this case

```bash
docker ps
```

### Build and Tag Images

This will generate local, staging and production images

```bash
docker build -t hello-world-app:local --build-arg ENVIRONMENT=local .
docker build -t hello-world-app:staging --build-arg ENVIRONMENT=staging .
docker build -t hello-world-app:prod --build-arg ENVIRONMENT=prod .
```

You can check these images with
```bash
docker images
```

Assuming you're using Docker Hub: make sure you are logged in

```bash
docker login
```

Tag your images to Your Registry: Assuming you're using Docker Hub:

```bash
docker tag hello-world-app:local zocker91/hello-world-app:local
docker tag hello-world-app:staging zocker91/hello-world-app:staging
docker tag hello-world-app:prod zocker91/hello-world-app:prod
```

Push Images to Your Registry: Assuming you're using Docker Hub:

```bash
docker push zocker91/hello-world-app:local
docker push zocker91/hello-world-app:staging
docker push zocker91/hello-world-app:prod
```

Deploy to relevant environment accordingly

```bash
docker stack deploy -c docker-compose.local.yml hello-world
docker stack deploy -c docker-compose.staging.yml hello-world
docker stack deploy -c docker-compose.prod.yml hello-world
```

Docker remove

```bash
docker stack rm hello-world
```

List All Active Stacks

```bash
docker stack ls
```

List All Active Services

```bash
docker service ls
```

Other Commands

```bash
docker network prune
docker volume prune
docker image prune -a
docker service ls
docker service logs hello-world_web
```

To check docker logs

```bash
docker service ls
docker service logs hello-world_web
```

<!-- docker swarm init
Swarm initialized: current node (qb8xatl0hvm9ocn33ie659olq) is now a manager.

To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-41bnlhabm2s0zsi3h6l1tlg7dtwv5su9zrat8xmjl8y1eh31m4-0msi5vnyovvsh7i2hq75yxjfn 192.168.0.153:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions. -->
