#!/usr/bin/env bash

VSCODE_BIN="/app/code-server/lib/vscode/bin/remote-cli/code-server"

# define extension list
extensions=(
aaron-bond.better-comments
albert.tabout
almenon.arepl
amazonwebservices.aws-toolkit-vscode
catppuccin.catppuccin-vsc
catppuccin.catppuccin-vsc-icons
christian-kohler.path-intellisense
continue.continue
davidanson.vscode-markdownlint
dbaeumer.vscode-eslint
donjayamanne.githistory
donjayamanne.python-environment-manager
donjayamanne.python-extension-pack
eamodio.gitlens
ecmel.vscode-html-css
esbenp.prettier-vscode
formulahendry.auto-rename-tag
foxundermoon.shell-format
github.vscode-github-actions
github.vscode-pull-request-github
glenn2223.live-sass
golang.go
grapecity.gc-excelviewer
gruntfuggly.todo-tree
hamza-aziane.obsidian-dark
hashicorp.hcl
hashicorp.terraform
hbenl.vscode-test-explorer
jerrygoyal.shortcut-menu-bar
johnpapa.vscode-peacock
kamikillerto.vscode-colorize
kevinrose.vsc-python-indent
littlefoxteam.vscode-python-test-adapter
mads-hartmann.bash-ide-vscode
magicstack.magicpython
marcostazi.vs-code-vagrantfile
mechatroner.rainbow-csv
mhutchie.git-graph
ms-azuretools.vscode-docker
ms-python.black-formatter
ms-python.debugpy
ms-python.isort
ms-python.pylint
ms-python.python
ms-vscode.makefile-tools
ms-vscode.powershell
ms-vscode.test-adapter-converter
mtxr.sqltools
mtxr.sqltools-driver-pg
mtxr.sqltools-driver-sqlite
njpwerner.autodocstring
oderwat.indent-rainbow
patbenatar.advanced-new-file
perkovec.emoji
pkief.material-icon-theme
rangav.vscode-thunder-client
redhat.ansible
redhat.vscode-commons
redhat.vscode-yaml
ritwickdey.liveserver
rust-lang.rust-analyzer
shardulm94.trailing-spaces
shd101wyy.markdown-preview-enhanced
signageos.signageos-vscode-sops
signageos.signageos-vscode-sops-beta
sleistner.vscode-fileutils
sourcery.sourcery
streetsidesoftware.code-spell-checker
tamasfe.even-better-toml
timonwong.shellcheck
tomoki1207.pdf
wholroyd.jinja
wix.vscode-import-cost
xabikos.javascriptsnippets
yoavbls.pretty-ts-errors
yzhang.markdown-all-in-one
zhuangtongfa.material-theme
)

# Function to install a single extension and handle output
install_extension() {
    local extension=$1
    local output
    output=$($VSCODE_BIN --install-extension "$extension" 2>&1)
    if echo "$output" | grep -q "not found"; then
        echo "Failed to install $extension"
        echo "$output"
    else
        echo "Successfully installed $extension"
    fi
}

# Iterate over the array and install each extension
for extension in "${extensions[@]}"; do
    install_extension "$extension"
done
