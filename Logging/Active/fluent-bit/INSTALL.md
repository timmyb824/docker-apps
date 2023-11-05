# Fluent-bit

## One-liner Installation

```bash
curl https://raw.githubusercontent.com/fluent/fluent-bit/master/install.sh | sh
```

## Installation Steps

1. Install dependancy if needed

   ```bash
   sudo apt-get install ca-certificates
   ```

2. Install gpg key

    ```bash
    # many need to run as root
    curl https://packages.fluentbit.io/fluentbit.key | gpg --dearmor > /usr/share/keyrings/fluentbit-keyring.gpg
    ```

3. Manually add to source to `/etc/apt/sources.list` file  with correct codename

    ```bash
    deb [signed-by=/usr/share/keyrings/fluentbit-keyring.gpg] https://packages.fluentbit.io/ubuntu/${CODENAME} ${CODENAME} main
    ```

4. Update apt and install fluent-bit

    ```bash
    sudo apt-get update

    sudo apt-get install fluent-bit

    sudo systemctl start fluent-bit
    ```
