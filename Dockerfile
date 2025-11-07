# Use an official Node.js LTS image as the base
FROM node:18-alpine

# Set working directory inside the container
WORKDIR /app

# Copy only package files first (to leverage Docker cache)
COPY package*.json ./

# Install dependencies (using npm ci for reproducibility)
RUN npm ci --only=production

# Copy the rest of the application code
COPY . .

# Expose the application port (adjust if needed)
EXPOSE 3000

# Define environment variables (optional)
ENV NODE_ENV=production

# Start the application
CMD ["npm", "start"]
