# Base Image
FROM node:20-alpine

# Project working directory
WORKDIR /app

ARG APP_ENV=development
# Set production environment
ENV NODE_ENV=${APP_ENV}

# =========================
# Enable pnpm via corepack
# =========================
RUN corepack enable

# =========================================================
# Copy dependency files
#
# pnpm  -> package.json + pnpm-lock.yaml
# npm   -> package.json package-lock.json ./
# yarn  -> package.json + yarn.lock
# =========================================================
COPY package.json package-lock.json ./

# =========================================================
# Install dependencies
#
# pnpm:
# RUN pnpm install --frozen-lockfile --prod
#
# npm:
# RUN npm ci --only=production
#
# yarn:
# RUN yarn install --production --frozen-lockfile
# =========================================================
RUN npm ci --only=production

# Copy all project files
COPY . .

# Application Port
EXPOSE 5000

# =========================================================
# Start Application
#
# pnpm:
# CMD ["pnpm", "dev"]
#
# npm:
# CMD ["npm", "run", "dev"]
#
# direct node:
# CMD ["node", "src/server.js"]
# =========================================================
CMD ["node", "src/server.js"]