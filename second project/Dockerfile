# Writing a dockerfile for a Node.js application


# Use an official Node.js runtime as a parent image
FROM node:14
# Set the working directory in the container
WORKDIR /usr/src/app
# Copy the package.json and package-lock.json files to the working directory
COPY package*.json ./
# Install the dependencies
RUN npm install
# Copy the rest of the application code to the working directory
COPY . . 
# The first dot represents the current directory on the host machine (where the Dockerfile is located), and the second dot represents the current directory in the container (the working directory we set earlier). This command copies all the files from the host machine's current directory to the container's current directory.

# Expose the port that the application will run on
EXPOSE 80

# Start the application when the container is initialized and specify the command to run the application
CMD ["node", "server.js"]

# This Dockerfile does the following:
# 1. It uses the official Node.js image as the base image.
# 2. It sets the working directory in the container to /usr/src/app.
# 3. It copies the package.json and package-lock.json files to the working directory.
# 4. It runs npm install to install the dependencies.
# 5. It copies the rest of the application code to the working directory.
# 6. It exposes port 80, which is the default HTTP port.
# 7. It specifies the command to start the application, which is node server.js.
