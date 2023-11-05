# Podman

## Manage Containers with Systemd

1) create new directory (allows for systemd user specific files)

    ```bash
    mkdir -p ~/.config/systemd/user
    cd $_
    ```

2) generate systemd unit files from **running** containers

    ```bash
    podman generate systemd --new --name --files container_name
    ```

3) if youd like to change restart policy (default = on-failure)

    ```bash
    podman generate systemd --restart-policy=always --new --name --files container_name
    ```

4) enable start on reboot

    ```bash
    systemctl --user enable --now container-nginx-proxy-manager
    ```

5) list running systemd containers

    ```bash
    systemctl --user list-units container\*
    ```

## Automate Container Updates

1) Add label to containers

    ```bash
    labels:
      io.containers.autoupdate: "registry"
    ```

    > **NOTE**: avoid using `:latest` within image name

    > **NOTE**: if not working then image_name is usually the issue

2) create systemd services for running containers - see *Manage Containers with Systemd* above

3) check for updates

    ```bash
    podman auto-update --dry-run
    ```

4) apply updates

    ```bash
    podman auto-update
    ```

5) enable podman auto updater to run daily

    ```bash
    sudo systemctl enable podman-auto-update.timer
    ```

6) to edit schedule

    ```bash
    sudo systemctl edit podman-auto-update.timer

    # adjust this
    [Timer]
    OnCalendar=Fri *-*-* 18:00
    ```

## Other

* restart Prometheus process inside the server container

  * 1 is the PID (Process ID) of prometheus process. You can run this to check on it:

     ```bash
    podman exec promserver ps
    ```

* kill all running containers

    ```bash
    sudo podman kill $(sudo podman ps -a -f "status=running" -q)
    ```

* remove all exited containers

    ```bash
    sudo podman ps -f status=exited --format "{{.ID}}" | xargs sudo podman rm -f
    ```

* prometheus podman exporter

  * tools is run by cloning the git repo and then running a user systemd unit [file](./prometheus-podman-exporter.service) that points to the binary file in the bin folder of the git repo
