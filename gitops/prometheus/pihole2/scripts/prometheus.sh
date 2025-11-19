podman run -d --name prometheus \
    --network prometheus \
    -p 9090:9090 \
    -v /home/tbryant/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml \
    -v prometheus_data:/prometheus \
	docker.io/prom/prometheus:latest
