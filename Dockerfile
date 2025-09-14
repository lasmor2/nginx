# Use a modern Node.js LTS image
FROM node:latest

# Set working directory
WORKDIR /app

# Copy package files first for better caching
COPY package.json package-lock.json* ./

# Install dependencies
RUN npm install

# Copy the rest of your app
COPY server.js .
COPY index.html .
COPY images ./images

# Expose port
EXPOSE 3000

# Run the app
CMD ["node", "server.js"]
