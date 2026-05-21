# Docker Command List

A simple and beginner-friendly Docker command reference.

---

# 📦 Docker Basics

## Check Docker Version

```bash
docker --version
```

````

## Show Docker Information

```bash
docker info
```

---

# 🖼️ Docker Image Commands

## Show All Images

```bash
docker images
```

## Build Docker Image

```bash
docker build -t my-image .
```

## Remove Docker Image

```bash
docker rmi my-image
```

## Remove Image Forcefully

```bash
docker rmi -f my-image
```

---

# 📦 Docker Container Commands

## Run Container

```bash
docker run my-image
```

## Run Container with Port Mapping

```bash
docker run -p 5000:5000 my-image
```

## Run Container with Name

```bash
docker run --name my-container -p 5000:5000 my-image
```

## Run Container in Background

```bash
docker run -d my-image
```

## Show Running Containers

```bash
docker ps
```

## Show All Containers

```bash
docker ps -a
```

## Stop Container

```bash
docker stop my-container
```

## Start Container

```bash
docker start my-container
```

## Restart Container

```bash
docker restart my-container
```

## Remove Container

```bash
docker rm my-container
```

## Force Remove Container

```bash
docker rm -f my-container
```

---

# 📄 Docker Logs Commands

## Show Container Logs

```bash
docker logs my-container
```

## Live Logs

```bash
docker logs -f my-container
```

---

# 💻 Docker Exec Commands

## Access Container Terminal

```bash
docker exec -it my-container sh
```

## Access Bash Terminal

```bash
docker exec -it my-container bash
```

---

# 📁 Docker Volume Commands

## Show Volumes

```bash
docker volume ls
```

## Create Volume

```bash
docker volume create my-volume
```

## Remove Volume

```bash
docker volume rm my-volume
```

---

# 🌐 Docker Network Commands

## Show Networks

```bash
docker network ls
```

## Create Network

```bash
docker network create my-network
```

## Remove Network

```bash
docker network rm my-network
```

---

# 🐳 Docker Compose Commands

## Start Services

```bash
docker compose up
```

## Start in Background

```bash
docker compose up -d
```

## Stop Services

```bash
docker compose down
```

## Rebuild Containers

```bash
docker compose up --build
```

---

# 🧹 Docker Cleanup Commands

## Remove Stopped Containers

```bash
docker container prune
```

## Remove Unused Images

```bash
docker image prune
```

## Remove Everything Unused

```bash
docker system prune
```

## Remove Everything Forcefully

```bash
docker system prune -a
```

---

# 🚀 Useful Commands

## Build and Run

```bash
docker build -t my-image .
docker run -p 5000:5000 my-image
```

## Remove Old Container and Run Again

```bash
docker rm -f my-container
docker run --name my-container -p 5000:5000 my-image
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
Full Stack Developer (MERN • Next.js • Docker)
````
