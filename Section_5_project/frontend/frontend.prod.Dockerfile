# ==========================================
# STAGE 1: Build the React SPA
# ==========================================
FROM node:18-alpine AS builder

WORKDIR /app

# Install dependencies (including dev tools needed for the build)
COPY package*.json ./
RUN npm install

# Copy all source files and build the production bundle
COPY . .
RUN npm run build


# ==========================================
# STAGE 2: Serve with Nginx Proxy
# ==========================================
FROM nginx:alpine

# Remove Nginx default HTML files
RUN rm -rf /usr/share/nginx/html/*

# Copy the production build folder from Stage 1
COPY --from=builder /app/build /usr/share/nginx/html

# Overwrite the default Nginx config with our custom reverse proxy config
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
