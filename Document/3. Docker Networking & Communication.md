# 🌐 Docker Networking & Communication

Docker containers run in isolated environments, but real-world applications require communication with external services, the host machine, and other containers. Docker networking makes these communication channels possible.

---

# 📚 Table of Contents

1. Types of Container Communication
2. Container to WWW Communication
3. Container to Host Machine Communication
4. Container to Container Communication
5. Docker Networking Architecture
6. Practical Examples
7. Docker Architecture Overview
8. Capstone Project Idea

---

# 1. Types of Container Communication

There are three common communication patterns in Docker:

## Container → WWW (Internet)

A container communicates with external websites, APIs, and cloud services.

Example:

```bash
docker run -it alpine sh
```

Inside the container:

```bash
ping google.com
```

---

## Container → Host Machine

A container communicates with services running on the local machine.

Example:

- Node.js server running on the host
- Docker container sends requests to that server

---

## Container → Container

One container communicates with another container.

Example:

- Frontend Container
- Backend Container
- Database Container

This is the most common communication pattern in multi-container applications.

---

# 2. Container to WWW Communication

By default, Docker containers have internet access through Docker's bridge network.

Run a container:

```bash
docker run -it alpine sh
```

Install curl:

```bash
apk add curl
```

Send a request:

```bash
curl https://google.com
```

If HTML content is returned, the container successfully communicates with the internet.

---

# 3. Container to Host Machine Communication

Suppose a server is running on your host machine:

```bash
npm start
```

Server URL:

```text
http://localhost:5000
```

From inside a container, `localhost` refers to the container itself, not the host machine.

To access the host machine:

```bash
curl http://host.docker.internal:5000
```

### Important Note

Inside a container:

```text
localhost = current container
```

To reach the host machine:

```text
host.docker.internal
```

---

# 4. Container to Container Communication

Containers can communicate using IP addresses or container names.

Create the first container:

```bash
docker run -d --name app1 nginx
```

Create the second container:

```bash
docker run -it --name app2 alpine sh
```

Find the IP address of app1:

```bash
docker inspect app1
```

Example IP:

```text
172.17.0.2
```

From app2:

```bash
ping 172.17.0.2
```

The communication should succeed.

---

# 5. How Docker Networking Simulates Real-World Networks

Docker networking behaves similarly to traditional computer networks.

Real World:

```text
Computer A → Router → Computer B
```

Docker:

```text
Container A → Docker Bridge Network → Container B
```

---

## Docker Bridge Network

List available networks:

```bash
docker network ls
```

Example output:

```text
bridge
host
none
```

---

### Bridge Network

Default Docker network.

```text
Container A
      │
      ▼
Docker Bridge
      ▲
      │
Container B
```

Provides communication between containers and internet access.

---

### Host Network

Shares the host machine's network stack.

```bash
docker run --network host nginx
```

Mostly used on Linux systems.

---

### None Network

Disables networking completely.

```bash
docker run --network none alpine
```

The container cannot communicate with the internet or other containers.

---

# 6. Practical Example: Container to WWW Communication

Run a container:

```bash
docker run -it alpine sh
```

Install curl:

```bash
apk add curl
```

Test internet access:

```bash
curl https://jsonplaceholder.typicode.com/posts/1
```

Expected output:

```json
{
  "id": 1
}
```

---

# 7. Practical Example: Container to Host Communication

Host Machine:

```bash
node server.js
```

Listening on:

```text
localhost:5000
```

Container:

```bash
docker run -it alpine sh
```

Request:

```bash
wget -qO- http://host.docker.internal:5000
```

Response:

```text
Hello From Host
```

---

# 8. Container-to-Container Communication Using IP

Start a web container:

```bash
docker run -d --name web nginx
```

Get the IP:

```bash
docker inspect web
```

Example:

```text
172.17.0.2
```

Create another container:

```bash
docker run -it alpine sh
```

Ping the first container:

```bash
ping 172.17.0.2
```

---

## Better Approach: Custom Networks

Create a custom network:

```bash
docker network create my-network
```

Run containers in the network:

```bash
docker run -d --network my-network --name web nginx
```

```bash
docker run -it --network my-network alpine sh
```

Access the container using its name:

```bash
ping web
```

No IP address is required.

Docker automatically resolves container names within the same network.

---

# 9. Docker Architecture Overview

Docker consists of several core components.

```text
+------------------+
| Docker Client    |
+------------------+
         |
         ▼
+------------------+
| Docker Daemon    |
+------------------+
         |
         ▼
+------------------+
| Containers       |
| Images           |
| Networks         |
| Volumes          |
+------------------+
```

---

## Docker Client

The command-line interface used to interact with Docker.

Examples:

```bash
docker build
docker run
docker ps
docker pull
```

---

## Docker Daemon

A background service responsible for:

- Building images
- Running containers
- Managing networks
- Managing volumes

---

## Docker Registry

Stores Docker images.

Example:

```bash
docker pull nginx
```

Docker downloads the image from a registry such as Docker Hub.

---

## Docker Image

A read-only blueprint used to create containers.

Examples:

```bash
nginx
node
mongo
```

---

## Docker Container

A running instance of an image.

Example:

```bash
docker run nginx
```

---

# Module Recap

In this module, you learned:

- Types of container communication
- Container to internet communication
- Container to host communication
- Container to container communication
- Docker bridge networking
- Custom networks
- Docker architecture
- Docker Client, Daemon, Registry, Images, and Containers

---

# 🚀 Capstone Project Idea

## Multi-Container MERN Application

Architecture:

```text
Frontend (React)
        │
        ▼
Backend (Node.js)
        │
        ▼
MongoDB
```

Containers:

```text
frontend-container
backend-container
mongodb-container
```

Requirements:

- Custom Docker Network
- Container-to-Container Communication
- Persistent MongoDB Volume
- Port Mapping
- Environment Variables

Create a network:

```bash
docker network create mern-network
```

Run all services within the same network and communicate using container names.

```text
frontend → backend
backend → mongodb
```

This project demonstrates how Docker networking works in real-world applications.
