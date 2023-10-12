#!/bin/bash

# This script is not needed but leaving it here for reference
docker-compose up -d --force-recreate
docker-compose exec semaphore ansible-galaxy role install --force -r /tmp/semaphore/requirements.yaml
docker-compose exec semaphore ansible-galaxy collection install --upgrade -r /tmp/semaphore/requirements.yml
