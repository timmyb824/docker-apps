# unbound_exporter

https://github.com/letsencrypt/unbound_exporter

## Install

Install `go` if you haven't already:

```bash
sudo apt install golang
```

Install `unbound_exporter`:

```bash
go install github.com/letsencrypt/unbound_exporter@latest
```

## Run

Start `zellij` session and run `unbound_exporter`:

```bash
unbound_exporter -unbound.ca -unbound.cert -unbound.host unix:///var/run/unbound-remote-control.sock
```
