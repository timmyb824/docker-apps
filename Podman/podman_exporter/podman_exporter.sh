#!/bin/bash

# If you want to run the exporter with podman see below.
# I do not run it like this opting to run the binary from the github repo instead.

sudo podman run --name podman_prom_exporter \
 -e CONTAINER_HOST=unix:///run/podman/podman.sock \
 -v /run/podman/podman.sock:/run/podman/podman.sock \
 -u root --security-opt  label=disable \
 -p 9882:9882 \
 quay.io/navidys/prometheus-podman-exporter


#podman run --name = podman_prom_exporter \
#-e CONTAINER_HOST=unix:///run/podman/podman.sock \
#-v $XDG_RUNTIME_DIR/podman/podman.sock:/run/podman/podman.sock \
#--userns=keep-id \
#--security-opt label=disable \
#-p 9882:9882 \
#quay.io/navidys/prometheus-podman-exporter
