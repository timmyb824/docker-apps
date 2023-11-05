# Summary

The Alerta monitoring system is a tool used to consolidate and de-duplicate alerts from multiple sources for quick ‘at-a-glance’ visualisation. With just one system you can monitor alerts from many other monitoring tools on a single screen.

## Installation

The provided instructions did not work for me while trying to install on an Oracle VM running aarch64. I had to resort to the following approach. I attempted to install using Docker and the DockerHub image, but encountered various issues. In order to make it work, I had to modify the Docker-related files.

1. Clone the alerta repo `git clone https://github.com/alerta/docker-alerta.git`

2. Replace `docker-compose.yml`, `Dockerfile`, and `docker-entrypoint.sh` with the files in this folder.

3. Build the docker image with `docker-compose up -d --build`
