# Base Image
FROM node:20-alpine

# Project working directory
WORKDIR /app

# Set production environment
ENV NODE_ENV=production

# =========================
# Enable pnpm via corepack
# =========================
RUN corepack enable

# =========================================================
# Copy dependency files
#
# pnpm  -> package.json + pnpm-lock.yaml
# npm   -> package.json + package-lock.json
# yarn  -> package.json + yarn.lock
# =========================================================
COPY package.json pnpm-lock.yaml ./

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
RUN pnpm install --frozen-lockfile --prod

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