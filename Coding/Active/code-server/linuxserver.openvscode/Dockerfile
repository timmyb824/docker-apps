FROM lscr.io/linuxserver/openvscode-server:latest

ENV OPENVSCODE="/app/openvscode-server/bin/openvscode-server"

USER root

RUN echo "nameserver 192.168.86.174" > /etc/resolv.conf

####### APT #######
RUN apt-get -y update && \
    apt-get -y install \
    gcc \
    apt-transport-https \
    gnupg2 \
    curl \
    build-essential \
    cmake \
    git \
    make \
    unzip \
    wget

####### EXTENSIONS #######
COPY ../scripts/install_thirdparty_extensions.sh /tmp/install_thirdparty_extensions.sh
COPY ../extensions /tmp/extensions
RUN chmod +x /tmp/install_thirdparty_extensions.sh
RUN /tmp/install_thirdparty_extensions.sh

RUN ${OPENVSCODE} --install-extension aaron-bond.better-comments && \
    ${OPENVSCODE} --install-extension catppuccin.catppuccin-vsc && \
    ${OPENVSCODE} --install-extension catppuccin.catppuccin-vsc-icons && \
    ${OPENVSCODE} --install-extension christian-kohler.path-intellisense && \
    ${OPENVSCODE} --install-extension continue.continue && \
    ${OPENVSCODE} --install-extension davidanson.vscode-markdownlint && \
    ${OPENVSCODE} --install-extension donjayamanne.githistory && \
    ${OPENVSCODE} --install-extension donjayamanne.python-environment-manager && \
    ${OPENVSCODE} --install-extension donjayamanne.python-extension-pack && \
    ${OPENVSCODE} --install-extension dotjoshjohnson.xml && \
    ${OPENVSCODE} --install-extension ecmel.vscode-html-css && \
    ${OPENVSCODE} --install-extension esbenp.prettier-vscode && \
    ${OPENVSCODE} --install-extension formulahendry.auto-rename-tag && \
    ${OPENVSCODE} --install-extension foxundermoon.shell-format && \
    ${OPENVSCODE} --install-extension github.vscode-github-actions && \
    ${OPENVSCODE} --install-extension github.vscode-pull-request-github && \
    ${OPENVSCODE} --install-extension glenn2223.live-sass && \
    ${OPENVSCODE} --install-extension golang.go && \
    ${OPENVSCODE} --install-extension grapecity.gc-excelviewer && \
    ${OPENVSCODE} --install-extension gruntfuggly.todo-tree && \
    ${OPENVSCODE} --install-extension hamza-aziane.obsidian-dark && \
    ${OPENVSCODE} --install-extension hashicorp.hcl && \
    ${OPENVSCODE} --install-extension hashicorp.terraform && \
    ${OPENVSCODE} --install-extension hbenl.vscode-test-explorer && \
    ${OPENVSCODE} --install-extension jerrygoyal.shortcut-menu-bar && \
    ${OPENVSCODE} --install-extension kamikillerto.vscode-colorize && \
    ${OPENVSCODE} --install-extension kevinrose.vsc-python-indent && \
    ${OPENVSCODE} --install-extension littlefoxteam.vscode-python-test-adapter && \
    ${OPENVSCODE} --install-extension mads-hartmann.bash-ide-vscode && \
    ${OPENVSCODE} --install-extension magicstack.magicpython && \
    ${OPENVSCODE} --install-extension marcostazi.vs-code-vagrantfile && \
    ${OPENVSCODE} --install-extension mechatroner.rainbow-csv && \
    ${OPENVSCODE} --install-extension mhutchie.git-graph && \
    ${OPENVSCODE} --install-extension ms-azuretools.vscode-docker && \
    ${OPENVSCODE} --install-extension ms-python.debugpy && \
    ${OPENVSCODE} --install-extension ms-python.isort && \
    ${OPENVSCODE} --install-extension ms-python.pylint && \
    ${OPENVSCODE} --install-extension ms-python.python && \
    ${OPENVSCODE} --install-extension ms-vscode.makefile-tools && \
    ${OPENVSCODE} --install-extension ms-vscode.test-adapter-converter && \
    ${OPENVSCODE} --install-extension njpwerner.autodocstring && \
    ${OPENVSCODE} --install-extension oderwat.indent-rainbow && \
    ${OPENVSCODE} --install-extension patbenatar.advanced-new-file && \
    ${OPENVSCODE} --install-extension pkief.material-icon-theme && \
    ${OPENVSCODE} --install-extension rangav.vscode-thunder-client && \
    ${OPENVSCODE} --install-extension redhat.ansible && \
    ${OPENVSCODE} --install-extension redhat.vscode-commons && \
    ${OPENVSCODE} --install-extension redhat.vscode-xml && \
    ${OPENVSCODE} --install-extension redhat.vscode-yaml && \
    ${OPENVSCODE} --install-extension ritwickdey.liveserver && \
    ${OPENVSCODE} --install-extension rust-lang.rust-analyzer && \
    ${OPENVSCODE} --install-extension shardulm94.trailing-spaces && \
    ${OPENVSCODE} --install-extension shd101wyy.markdown-preview-enhanced && \
    ${OPENVSCODE} --install-extension signageos.signageos-vscode-sops && \
    ${OPENVSCODE} --install-extension signageos.signageos-vscode-sops-beta && \
    ${OPENVSCODE} --install-extension sleistner.vscode-fileutils && \
    ${OPENVSCODE} --install-extension sourcery.sourcery && \
    ${OPENVSCODE} --install-extension streetsidesoftware.code-spell-checker && \
    ${OPENVSCODE} --install-extension tamasfe.even-better-toml && \
    ${OPENVSCODE} --install-extension timonwong.shellcheck && \
    ${OPENVSCODE} --install-extension tomoki1207.pdf && \
    ${OPENVSCODE} --install-extension wesbos.theme-cobalt2 && \
    ${OPENVSCODE} --install-extension wholroyd.jinja && \
    ${OPENVSCODE} --install-extension wix.vscode-import-cost && \
    ${OPENVSCODE} --install-extension yoavbls.pretty-ts-errors && \
    ${OPENVSCODE} --install-extension yzhang.markdown-all-in-one

####### DOTFILES #######
RUN git clone https://github.com/timmyb824/dotfiles_linux.git /config/workspace/dotfiles_linux

USER abc
