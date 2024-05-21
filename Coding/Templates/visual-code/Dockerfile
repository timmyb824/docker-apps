# Use Ubuntu as the base image
FROM ubuntu:24.04

ARG ROOT_PASSWORD
ARG USER_NAME
ARG USER_PASSWORD
ARG TOKEN
ARG ARCH_TYPE

# Set the root password for the IDE system
RUN echo "root:${ROOT_PASSWORD}" | chpasswd

# Install necessary packages
RUN apt-get update && apt-get install -y software-properties-common apt-transport-https wget

# Add the Microsoft GPG key
RUN wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | gpg --dearmor | tee /etc/apt/trusted.gpg.d/microsoft.gpg

# Add the Visual Studio Code repository
RUN echo "deb [arch=${ARCH_TYPE}] https://packages.microsoft.com/repos/code stable main" | tee /etc/apt/sources.list.d/vscode.list

# Install needed packages on your IDE system
RUN apt-get update && apt-get install -y code
RUN apt-get -y install sudo -y \
  nano \
  git \
  curl \
  wget \
  unzip \
  npm \
  ssh

# Create a non-root user
RUN useradd -m "${USER_NAME}"

# Set the password for the non-root user
RUN echo "${USER_NAME}:${USER_PASSWORD}" | chpasswd

# Add the non-root user to the sudo group
RUN adduser "${USER_NAME}" sudo

# Switch to the non-root user
USER "${USER_NAME}"

# Set the home directory for the non-root user
ENV HOME /home/${USER_NAME}

# Expose the port for VS Code
EXPOSE 8585

# Start Visual Studio Code on port 8585 from anywhere (0.0.0.0)
CMD ["code", "serve-web", "--host", "0.0.0.0", "--port", "8585", "--user-data-dir", "/home/${USER_NAME}", "--connection-token", "${TOKEN}"]
