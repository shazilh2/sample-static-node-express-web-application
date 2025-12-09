# Use an official Node.js runtime as a parent image
FROM node:20-alpine

# Set the working directory in the container
WORKDIR /

# Copy package.json and package-lock.json (if available) to the working directory
# This allows npm install to leverage Docker's layer caching
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Expose the port your Node.js app listens on
EXPOSE 3000

# Define the command to run your application
CMD [ "node", "index.js" ]
