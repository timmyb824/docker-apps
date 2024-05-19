FROM codercom/code-server:latest

USER root

RUN echo "nameserver 192.168.86.174" > /etc/resolv.conf

####### APT #######
RUN apt-get -y update && \
    apt-get -y install \
    gcc \
    apt-transport-https \
    gnupg2 \
    curl \
    build-essential \
    cmake \
    git \
    htop \
    jq \
    make \
    unzip \
    wget

RUN git clone https://github.com/timmyb824/dotfiles_linux.git /home/coder/dotfiles_linux
