# 📦 Docker Data Management & Volumes Guide

A beginner-friendly guide to understanding Docker data management, volumes, bind mounts, environment variables, and `.dockerignore`.

---

# 55-1: Why Data Management Matters in Docker

Docker containers are **ephemeral**.

That means:

- When a container is deleted, its internal data is also deleted.
- Containers are temporary by design.

Without proper data management:

- Database data can disappear
- Uploaded files can be lost
- Logs and configurations can vanish

## ✅ Why Data Persistence is Important

We need persistent storage for:

- Databases
- Uploaded files
- Application logs
- Configuration files

Docker provides:

1. **Volumes**
2. **Bind Mounts**

---

# 55-2: Understanding Data Categories

Docker data can be divided into two categories.

## 1️⃣ Temporary Data

Data that does not need to survive container removal.

Examples:

- Cache files
- Temporary build artifacts

Stored inside:

- Writable Container Layer

---

## 2️⃣ Persistent Data

Data that must survive container deletion.

Examples:

- Database files
- Uploaded images
- User data

Stored using:

- Docker Volumes
- Bind Mounts

---

# 55-3: The Writable Container Layer Explained

Every Docker container has a writable layer.

## How It Works

Docker image layers are:

- Read-only

When a container starts:

- Docker adds a writable layer on top

All runtime changes go there.

Example:

- Creating files
- Installing packages
- Modifying app data

---

## ❌ Problem

If the container is removed:

```bash
docker rm container-name
```

All writable layer data is deleted.

---

## Example

Run container:

```bash
docker run -it ubuntu bash
```

Create file:

```bash
touch test.txt
```

Exit container:

```bash
exit
```

Remove container:

```bash
docker rm container-id
```

The file is gone forever.

---

# 55-4: Understanding Docker Volume

Docker Volumes are the preferred way to persist data.

## ✅ Benefits

- Persistent storage
- Better performance
- Easy backup
- Managed by Docker
- Share data between containers

---

## Volume Architecture

```text
Container → Volume → Host Machine Storage
```

Docker stores volumes in:

Linux:

```bash
/var/lib/docker/volumes/
```

---

## Create a Volume

```bash
docker volume create my-volume
```

---

## List Volumes

```bash
docker volume ls
```

---

## Inspect Volume

```bash
docker volume inspect my-volume
```

---

# 55-5: Managing Volumes with the Docker CLI

## Attach Volume to Container

```bash
docker run -d \
  --name postgres-container \
  -v my-volume:/var/lib/postgresql/data \
  postgres
```

---

## Named Volume Syntax

```bash
-v volume-name:container-path
```

Example:

```bash
-v mydata:/app/data
```

---

## Anonymous Volume

```bash
docker run -v /app/data nginx
```

Docker automatically creates unnamed volume.

---

## Remove Volume

```bash
docker volume rm my-volume
```

---

## Remove Unused Volumes

```bash
docker volume prune
```

---

## Example with Node.js

```bash
docker run -d \
  --name node-app \
  -v node-data:/app/data \
  node
```

---

# 55-6: Hands-on Docker Bind Mounts

Bind mounts connect:

- A local host directory
- To a container directory

---

## Bind Mount Syntax

```bash
-v host-path:container-path
```

---

## Example

Linux/macOS:

```bash
docker run -it \
  -v $(pwd):/app \
  node
```

Windows PowerShell:

```powershell
docker run -it `
  -v ${PWD}:/app `
  node
```

---

## Use Case

Best for:

- Development
- Live code editing
- Hot reload

---

## Example with Nginx

```bash
docker run -d \
  --name my-nginx \
  -p 8080:80 \
  -v $(pwd)/html:/usr/share/nginx/html \
  nginx
```

Now local HTML changes instantly reflect inside container.

---

# 55-7: Solving A Classic Problem Combining Volumes and Bind Mounts

## Problem

In development:

- We want live source code updates
- But don't want local `node_modules` overriding container modules

---

## Solution

Use:

1. Bind Mount → source code
2. Volume → node_modules

---

## Example

```bash
docker run -it \
  -v $(pwd):/app \
  -v /app/node_modules \
  node
```

---

## Better Example

```bash
docker run -it \
  -p 3000:3000 \
  -v $(pwd):/app \
  -v /app/node_modules \
  react-app
```

---

## Why This Works

| Mount Type | Purpose                         |
| ---------- | ------------------------------- |
| Bind Mount | Sync source code                |
| Volume     | Preserve container dependencies |

---

# 55-8: Environment Variables and .env Files

Environment variables help manage:

- Secrets
- API keys
- Configurations

---

# Pass Environment Variables

## Single Variable

```bash
docker run -e PORT=5000 nginx
```

---

## Multiple Variables

```bash
docker run \
  -e NODE_ENV=production \
  -e PORT=5000 \
  my-app
```

---

# Using `.env` File

Create `.env`

```env
PORT=5000
DB_USER=admin
DB_PASS=123456
```

---

## Run Container Using `.env`

```bash
docker run --env-file .env my-app
```

---

# Docker Compose Example

```yaml
services:
  app:
    env_file:
      - .env
```

---

# 55-9: The .dockerignore File

`.dockerignore` works like `.gitignore`.

It prevents unnecessary files from being copied into Docker image.

---

# Why Use `.dockerignore`

✅ Smaller image size

✅ Faster build

✅ Better security

✅ Cleaner images

---

# Example `.dockerignore`

```dockerignore
node_modules
.git
.env
dist
coverage
Dockerfile
README.md
```

---

# Build Docker Image

```bash
docker build -t my-app .
```

Ignored files won't be copied.

---

# 55-10: Module Recap and Volumes vs Bind Mounts Decision Guide

# Docker Storage Options Comparison

| Feature                  | Volume | Bind Mount |
| ------------------------ | ------ | ---------- |
| Managed by Docker        | ✅     | ❌         |
| Easy Backup              | ✅     | ❌         |
| Performance              | Better | Good       |
| Development Use          | Medium | Best       |
| Production Use           | Best   | Medium     |
| Host Path Required       | ❌     | ✅         |
| Share Between Containers | ✅     | ✅         |

---

# ✅ When to Use Volumes

Use Volumes for:

- Databases
- Persistent app data
- Production applications
- Shared container storage

Example:

```bash
docker run -v db-data:/var/lib/mysql mysql
```

---

# ✅ When to Use Bind Mounts

Use Bind Mounts for:

- Local development
- Live code sync
- Hot reload

Example:

```bash
docker run -v $(pwd):/app node
```

---

# 🔥 Important Docker Commands Recap

## Volume Commands

```bash
docker volume create my-volume
docker volume ls
docker volume inspect my-volume
docker volume rm my-volume
docker volume prune
```

---

## Container with Volume

```bash
docker run -v my-volume:/app/data nginx
```

---

## Container with Bind Mount

```bash
docker run -v $(pwd):/app node
```

---

## Environment Variables

```bash
docker run -e PORT=5000 nginx
docker run --env-file .env my-app
```

---

## Build Docker Image

```bash
docker build -t my-app .
```

---

# ✅ Final Summary

Docker containers are temporary.

To persist data properly:

- Use Volumes for production
- Use Bind Mounts for development

Also:

- Use `.env` files for configurations
- Use `.dockerignore` for optimized images

These are essential Docker concepts for real-world applications.
