# Instructions

1. Install the agent from the UI script:

```bash
curl -fsSL https://pulse.local.timmybtech.com/install.sh | sudo bash -s -- --url https://pulse.local.timmybtech.com --token redacted --interval 30s
```

2. Add the following to your `/etc/systemd/system/pulse-agent.service`:

```ini
[Unit]
Description=Pulse Unified Agent
After=network-online.target docker.service
Wants=network-online.target
StartLimitIntervalSec=0

[Service]
Type=simple
# Added --enable-docker for podman support
ExecStart=/usr/local/bin/pulse-agent --url https://pulse.local.timmybtech.com --token redacted --interval 30s --enable-host --enable-docker
Restart=always
RestartSec=5s
User=root
# Added for rootless podman
Environment=DOCKER_HOST=unix:///run/user/1000/podman/podman.sock
Environment=XDG_RUNTIME_DIR=/run/user/1000

[Install]
WantedBy=multi-user.target
```

3. Enable and start the agent:

```bash
sudo systemctl daemon-reload
sudo systemctl enable --now pulse-agent
```

4. To uninstall the agent:

```bash
curl -fsSL https://pulse.local.timmybtech.com/install.sh | sudo bash -s -- --url https://pulse.local.timmybtech.com --uninstall
```
