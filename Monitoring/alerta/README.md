# Summary

The Alerta monitoring system is a tool used to consolidate and de-duplicate alerts from multiple sources for quick ‘at-a-glance’ visualisation. With just one system you can monitor alerts from many other monitoring tools on a single screen.

## Installation

Using the documented instructions were not working for me. I had to use the following. I tried to install using docker and the dockerhub image but kept running into problems. To get it working I had to make some changes to the docker related files:

1. Clone the alerta repo

```bash
git clone https://github.com/alerta/docker-alerta.git

2. Replace docker-compose.yml, Dockerfile, and docker-entrypoint.sh with the files in this folder.

3. Build the docker image with `docker-compose up -d --build`