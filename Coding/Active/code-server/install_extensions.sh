#!/usr/bin/env bash

# define extension list
extensions=(
100lvlmaster.one-for-all
aaron-bond.better-comments
actionforge.actionforge
albert.tabout
alefragnani.project-manager
almenon.arepl
amazonwebservices.amazon-q-vscode
amazonwebservices.aws-toolkit-vscode
antonreshetov.masscode-assistant
batisteo.vscode-django
bbenoist.shell
catppuccin.catppuccin-vsc
catppuccin.catppuccin-vsc-icons
christian-kohler.path-intellisense
chrmarti.regex
coder.coder-remote
continue.continue
davidanson.vscode-markdownlint
dbaeumer.vscode-eslint
deerawan.vscode-dash
denoland.vscode-deno
docsmsft.docs-yaml
donjayamanne.githistory
donjayamanne.python-environment-manager
donjayamanne.python-extension-pack
dotenv.dotenv-vscode
dotjoshjohnson.xml
dsznajder.es7-react-js-snippets
eamodio.gitlens
ecmel.vscode-html-css
esbenp.prettier-vscode
evan-buss.font-switcher
formulahendry.auto-rename-tag
formulahendry.code-runner
fosshaas.fontsize-shortcuts
foxundermoon.shell-format
github.codespaces
github.copilot
github.copilot-chat
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
jevakallio.vscode-live-frame
johnpapa.vscode-peacock
kamikillerto.vscode-colorize
kevinrose.vsc-python-indent
littlefoxteam.vscode-python-test-adapter
mads-hartmann.bash-ide-vscode
magicstack.magicpython
marcostazi.vs-code-vagrantfile
mechatroner.rainbow-csv
mhutchie.git-graph
mrded.railscasts
ms-azuretools.vscode-docker
ms-ossdata.vscode-postgresql
ms-python.black-formatter
ms-python.debugpy
ms-python.isort
ms-python.pylint
ms-python.python
ms-python.vscode-pylance
ms-toolsai.jupyter-keymap
ms-vscode-remote.remote-containers
ms-vscode-remote.remote-ssh
ms-vscode-remote.remote-ssh-edit
ms-vscode-remote.remote-wsl
ms-vscode-remote.vscode-remote-extensionpack
ms-vscode.makefile-tools
ms-vscode.powershell
ms-vscode.remote-explorer
ms-vscode.remote-server
ms-vscode.test-adapter-converter
ms-vsliveshare.vsliveshare
msjsdiag.vscode-react-native
mtxr.sqltools
mtxr.sqltools-driver-pg
mtxr.sqltools-driver-sqlite
njpwerner.autodocstring
oderwat.indent-rainbow
parallelsdesktop.parallels-desktop
patbenatar.advanced-new-file
perkovec.emoji
pkief.material-icon-theme
quicktype.quicktype
rangav.vscode-thunder-client
redhat.ansible
redhat.vscode-commons
redhat.vscode-xml
redhat.vscode-yaml
ritwickdey.liveserver
rubymaniac.vscode-direnv
rust-lang.rust-analyzer
shardulm94.trailing-spaces
shd101wyy.markdown-preview-enhanced
signageos.signageos-vscode-sops
signageos.signageos-vscode-sops-beta
sleistner.vscode-fileutils
sourcery.sourcery
streetsidesoftware.code-spell-checker
tabnine.tabnine-vscode
tamasfe.even-better-toml
teamhub.teamhub
timonwong.shellcheck
tomoki1207.pdf
tomrijndorp.find-it-faster
visualstudioexptteam.intellicode-api-usage-examples
visualstudioexptteam.vscodeintellicode
wesbos.theme-cobalt2
wholroyd.jinja
wix.vscode-import-cost
xabikos.javascriptsnippets
yinfei.luahelper
yoavbls.pretty-ts-errors
youssef.viow
yzhang.markdown-all-in-one
zhuangtongfa.material-theme
)

# Function to install a single extension and handle output
install_extension() {
    local extension=$1
    local output
    output=$(code-server --install-extension "$extension" 2>&1)
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
