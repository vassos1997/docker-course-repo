FROM node:18-alpine

WORKDIR /app

# Copy package files first to leverage Docker layer caching
COPY package*.json ./

# Install only production dependencies
RUN npm install --omit=dev

# Copy the rest of the backend source code
COPY . .

# In production, we don't expose ports in the Dockerfile if ECS handles it,
# but it's good practice for documentation. The backend will use Port 5000.
# We don't use nodemon in production, just raw node.
CMD ["node", "app.js"]
