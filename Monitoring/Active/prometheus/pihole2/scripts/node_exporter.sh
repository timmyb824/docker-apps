podman run -d \
  --name node_exporter \
  --pid host \
  --network prometheus  \
  -p 9100:9100 \
  -v '/:/host:ro,rslave' \
  quay.io/prometheus/node-exporter:latest \
  --path.rootfs=/host
