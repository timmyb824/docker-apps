# Atuin

## Installation

I do not currently have atuin deployed using Docker. Instead, I utilized the installation script provided in the documentation.

```bash
# https://atuin.sh/docs/
bash <(curl https://raw.githubusercontent.com/ellie/atuin/main/install.sh)

atuin register -u ${USERNAME} -e ${EMAIL}
atuin import auto
atuin sync
```

## Usage

`#envsubst`

1) You are using the server the developer hosts for syncing. This was done using commnad:

    `atuin register -u ${USERNAME} -e ${EMAIL} -p ${PASSWORD}`

2) To get your key so other systems can join:

    `atuin key`

    Then run:

    `atuin login -u ${USERNAME} -p ${PASSWORD} -k ${KEY}}`

3) To get a cool graph with all your stats:

    `curl https://api.atuin.sh/enable -d $(cat ~/.local/share/atuin/session)`
