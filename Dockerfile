# Set the base image
FROM node:16-slim

# Expose port 5000
EXPOSE 5000

# Set the working directory
WORKDIR /usr/src/app
# Set environment variables
ENV REACT_APP_BACKEND_URL=/api

# Copy package.json and package-lock.json 
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the project files into the container
COPY . .

# Build static files
RUN npm run build

# Install server globally
RUN npm install -g serve

# Run the application
CMD ["serve","-s","-l","5000","build"]

