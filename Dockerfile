# --- Build stage ---
FROM node:22-alpine AS build
WORKDIR /app

# Install bun (used as package manager; scripts run under Node)
RUN npm install -g bun

# Install dependencies (cached layer as long as lockfile doesn't change)
COPY package.json bun.lock ./
RUN bun install --frozen-lockfile

# Build the app (type-check + vite build)
COPY . .
RUN bun run build

# --- Serve stage ---
FROM nginx:alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
