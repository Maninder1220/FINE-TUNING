FROM ubuntu:18.04

# Update package lists and install default-jdk
RUN apt update && apt install -y default-jdk && rm -rf /var/lib/apt/lists/*

# Create the directory /home/jProj | -p creates both directories
RUN mkdir -p /home/jProj

# Set the working directory
WORKDIR /home/jProj

# Copy the current directory contents into /home/jProj in the container
COPY . .

# List the contents of the directory and remain in the shell
CMD ["bash", "-c", "ls -a && exec bash"]