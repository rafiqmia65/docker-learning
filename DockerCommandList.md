# 🐳 Docker Command List

A clean and beginner-friendly Docker command reference.

---

# 📦 Docker Basics Commands

| Command            | Description                    |
| ------------------ | ------------------------------ |
| `docker --version` | Show Docker version            |
| `docker info`      | Show Docker system information |

---

# 🖼️ Docker Image Commands

| Command                      | Description                    |
| ---------------------------- | ------------------------------ |
| `docker images`              | Show all images                |
| `docker pull image-name`     | Download image from Docker Hub |
| `docker build -t my-image .` | Build Docker image             |
| `docker rmi my-image`        | Remove image                   |
| `docker rmi -f my-image`     | Force remove image             |
| `docker image prune`         | Remove unused images           |

---

# 📦 Docker Container Commands

| Command                                   | Description             |
| ----------------------------------------- | ----------------------- |
| `docker run my-image`                     | Run container           |
| `docker run -p 5000:5000 my-image`        | Run with port mapping   |
| `docker run --name my-container my-image` | Run with custom name    |
| `docker run -d my-image`                  | Run in detached mode    |
| `docker ps`                               | Show running containers |
| `docker ps -a`                            | Show all containers     |
| `docker stop my-container`                | Stop container          |
| `docker start my-container`               | Start container         |
| `docker restart my-container`             | Restart container       |
| `docker rm my-container`                  | Remove container        |
| `docker rm -f my-container`               | Force remove container  |

---

# 📄 Docker Logs Commands

| Command                       | Description         |
| ----------------------------- | ------------------- |
| `docker logs my-container`    | Show container logs |
| `docker logs -f my-container` | Show live logs      |

---

# 💻 Docker Exec Commands

| Command                             | Description                 |
| ----------------------------------- | --------------------------- |
| `docker exec -it my-container sh`   | Open shell inside container |
| `docker exec -it my-container bash` | Open bash terminal          |

---

# 📁 Docker Volume Commands

| Command                          | Description      |
| -------------------------------- | ---------------- |
| `docker volume ls`               | Show all volumes |
| `docker volume create my-volume` | Create volume    |
| `docker volume rm my-volume`     | Remove volume    |

---

# 🌐 Docker Network Commands

| Command                            | Description    |
| ---------------------------------- | -------------- |
| `docker network ls`                | Show networks  |
| `docker network create my-network` | Create network |
| `docker network rm my-network`     | Remove network |

---

# 🐳 Docker Compose Commands

| Command                     | Description         |
| --------------------------- | ------------------- |
| `docker compose up`         | Start services      |
| `docker compose up -d`      | Start in background |
| `docker compose down`       | Stop services       |
| `docker compose up --build` | Rebuild and start   |

---

# 🧹 Docker Cleanup Commands

| Command                  | Description               |
| ------------------------ | ------------------------- |
| `docker container prune` | Remove stopped containers |
| `docker image prune`     | Remove unused images      |
| `docker system prune`    | Remove unused Docker data |
| `docker system prune -a` | Remove everything unused  |

---

# 🚀 Useful Docker Commands

## Build Image

```bash
docker build -t my-image .
```

## Run Container

```bash
docker run -p 5000:5000 my-image
```

## Remove Old Container and Run Again

```bash
docker rm -f my-container
docker run --name my-container -p 5000:5000 my-image
```

---

# 🖼️ Managing Docker Images Commands

| Command                            | Description                    |
| ---------------------------------- | ------------------------------ |
| `docker images`                    | Show all Docker images         |
| `docker image ls`                  | List all images                |
| `docker pull node:20-alpine`       | Download image from Docker Hub |
| `docker build -t my-image .`       | Build Docker image             |
| `docker tag my-image username/app` | Tag image for Docker Hub       |
| `docker rmi my-image`              | Remove image                   |
| `docker rmi -f my-image`           | Force remove image             |
| `docker image inspect my-image`    | Show image details             |
| `docker image history my-image`    | Show image history             |
| `docker image prune`               | Remove unused images           |

---

# 📦 Managing Docker Containers Commands

| Command                                   | Description                    |
| ----------------------------------------- | ------------------------------ |
| `docker run my-image`                     | Run container                  |
| `docker run -d my-image`                  | Run container in background    |
| `docker run --name my-container my-image` | Run with custom container name |
| `docker run -p 5000:5000 my-image`        | Run with port mapping          |
| `docker ps`                               | Show running containers        |
| `docker ps -a`                            | Show all containers            |
| `docker stop my-container`                | Stop container                 |
| `docker start my-container`               | Start container                |
| `docker restart my-container`             | Restart container              |
| `docker pause my-container`               | Pause container                |
| `docker unpause my-container`             | Unpause container              |
| `docker rm my-container`                  | Remove container               |
| `docker rm -f my-container`               | Force remove container         |
| `docker inspect my-container`             | Show container details         |
| `docker stats`                            | Show live resource usage       |
| `docker top my-container`                 | Show running processes         |

---

# 🔄 Docker Container Restart Policies

| Command                                                         | Description                     |
| --------------------------------------------------------------- | ------------------------------- |
| `docker run --restart=no my-image`                              | No automatic restart            |
| `docker run --restart=always my-image`                          | Always restart container        |
| `docker run --restart=on-failure my-image`                      | Restart only on failure         |
| `docker run --restart=unless-stopped my-image`                  | Restart unless manually stopped |
| `docker update --restart=always my-container`                   | Update restart policy           |
| `docker inspect -f "{{ .HostConfig.RestartPolicy }}" container` | Show restart policy details     |

---

# 🚀 Pushing Docker Image to Docker Hub

## Login to Docker Hub

```bash
docker login
```

## Tag Docker Image

```bash
docker tag my-image username/my-image
```

## Push Image to Docker Hub

```bash
docker push username/my-image
```

## Push Specific Version

```bash
docker push username/my-image:v1
```

---

# 📥 Pulling Docker Image from Docker Hub

## Pull Latest Image

```bash
docker pull username/my-image
```

## Pull Specific Version

```bash
docker pull username/my-image:v1
```

## Run Pulled Image

```bash
docker run -p 5000:5000 username/my-image
```

---

# 📌 Example Dockerfile

```Dockerfile
FROM node:20-alpine

WORKDIR /app

COPY package.json pnpm-lock.yaml ./

RUN corepack enable
RUN pnpm install --frozen-lockfile

COPY . .

EXPOSE 5000

CMD ["node", "src/server.js"]
```

---

# 👨‍💻 Author

Md Rafiq Mia  
Full Stack Developer
