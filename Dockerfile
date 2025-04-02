# Use Node.js base image
FROM node:18

# Set working directory
WORKDIR /app

# Copy application files
COPY . .

# Install dependencies
RUN npm install

# Expose the application port
EXPOSE 5000

# Run the application
CMD ["node", "server.js"]
