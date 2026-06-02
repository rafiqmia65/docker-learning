# Docker Express Server

A minimal Node.js Express application packaged with Docker.

## Project Overview

- `src/server.js` - simple Express server that responds with JSON on `/`
- `Dockerfile` - builds the app into a Docker image
- `package.json` - defines dependencies and a development script

## Requirements

- Node.js 20+ (for local development)
- npm
- Docker (for container build and run)

## Local Development

Install dependencies:

```bash
npm install
```

Start the server in development mode:

```bash
npm run dev
```

The server listens on port `5000` by default.

Open:

```text
http://localhost:5000/
```

## Docker

Build the Docker image:

```bash
docker build -t docker-express-app .
```

Run the container:

```bash
docker run -p 5000:5000 --env APP_ENV=production docker-express-app
```

Then visit:

```text
http://localhost:5000/
```

## Documentation

This project includes helpful Docker reference files in the `Document/` folder:

- `Document/1. DockerCommandList.md` — common Docker CLI commands and examples
- `Document/2. Docker Volume & Data Management.md` — Docker persistence, volumes, bind mounts, environment management, and `.dockerignore`
- `Document/3. Docker Networking & Communication.md` — Docker networking patterns, container communication, and architecture

Use these docs for learning Docker commands, data handling, and networking while working with this app.

## Notes

- The Dockerfile uses `node:20-alpine` and installs production dependencies via `npm ci --only=production`.
- `NODE_ENV` is set from the `APP_ENV` build argument.
- The container entrypoint starts the server with `node src/server.js`.
