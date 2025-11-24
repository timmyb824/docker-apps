VERSION=v0.46.0 # use the latest release version from https://github.com/google/cadvisor/releases
sudo podman run -d --name cadvisor \
  --network prometheus \
  --volume /:/rootfs:ro \
  --volume /var/run:/var/run:rw \
  --volume /sys:/sys:ro \
  --volume /sys/fs/cgroup:/sys/fs/cgroup:ro \
  --volume /dev/disk/:/dev/disk:ro \
  --volume /var/lib/containers:/var/lib/containers:ro \
  --privileged \
  -p 8080:8080 \
  gcr.io/cadvisor/cadvisor:$VERSION
