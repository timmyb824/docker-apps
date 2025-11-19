FROM codercom/code-server:latest

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
    htop \
    jq \
    make \
    unzip \
    wget

####### CODE-SERVER EXTENSIONS #######
# Helpful for installing extensions when you're unsure which may not be found (missing extensions can cause the build to fail)
# COPY install_extensions.sh /home/coder/install_extensions.sh
# RUN chmod +x /home/coder/install_extensions.sh
# RUN /home/coder/install_extensions.sh


RUN code-server --install-extension aaron-bond.better-comments && \
    code-server --install-extension catppuccin.catppuccin-vsc && \
    code-server --install-extension catppuccin.catppuccin-vsc-icons && \
    code-server --install-extension christian-kohler.path-intellisense && \
    code-server --install-extension continue.continue && \
    code-server --install-extension davidanson.vscode-markdownlint && \
    code-server --install-extension donjayamanne.githistory && \
    code-server --install-extension donjayamanne.python-environment-manager && \
    code-server --install-extension donjayamanne.python-extension-pack && \
    code-server --install-extension dotjoshjohnson.xml && \
    code-server --install-extension ecmel.vscode-html-css && \
    code-server --install-extension esbenp.prettier-vscode && \
    code-server --install-extension formulahendry.auto-rename-tag && \
    code-server --install-extension foxundermoon.shell-format && \
    code-server --install-extension github.vscode-github-actions && \
    code-server --install-extension github.vscode-pull-request-github && \
    code-server --install-extension glenn2223.live-sass && \
    code-server --install-extension golang.go && \
    code-server --install-extension grapecity.gc-excelviewer && \
    code-server --install-extension gruntfuggly.todo-tree && \
    code-server --install-extension hamza-aziane.obsidian-dark && \
    code-server --install-extension hashicorp.hcl && \
    code-server --install-extension hashicorp.terraform && \
    code-server --install-extension hbenl.vscode-test-explorer && \
    code-server --install-extension jerrygoyal.shortcut-menu-bar && \
    code-server --install-extension kamikillerto.vscode-colorize && \
    code-server --install-extension kevinrose.vsc-python-indent && \
    code-server --install-extension littlefoxteam.vscode-python-test-adapter && \
    code-server --install-extension mads-hartmann.bash-ide-vscode && \
    code-server --install-extension magicstack.magicpython && \
    code-server --install-extension marcostazi.vs-code-vagrantfile && \
    code-server --install-extension mechatroner.rainbow-csv && \
    code-server --install-extension mhutchie.git-graph && \
    code-server --install-extension ms-azuretools.vscode-docker && \
    code-server --install-extension ms-python.debugpy && \
    code-server --install-extension ms-python.isort && \
    code-server --install-extension ms-python.pylint && \
    code-server --install-extension ms-python.python && \
    code-server --install-extension ms-vscode.makefile-tools && \
    code-server --install-extension ms-vscode.test-adapter-converter && \
    code-server --install-extension njpwerner.autodocstring && \
    code-server --install-extension oderwat.indent-rainbow && \
    code-server --install-extension patbenatar.advanced-new-file && \
    code-server --install-extension pkief.material-icon-theme && \
    code-server --install-extension rangav.vscode-thunder-client && \
    code-server --install-extension redhat.ansible && \
    code-server --install-extension redhat.vscode-commons && \
    code-server --install-extension redhat.vscode-xml && \
    code-server --install-extension redhat.vscode-yaml && \
    code-server --install-extension ritwickdey.liveserver && \
    code-server --install-extension rust-lang.rust-analyzer && \
    code-server --install-extension shardulm94.trailing-spaces && \
    code-server --install-extension shd101wyy.markdown-preview-enhanced && \
    code-server --install-extension signageos.signageos-vscode-sops && \
    code-server --install-extension signageos.signageos-vscode-sops-beta && \
    code-server --install-extension sleistner.vscode-fileutils && \
    code-server --install-extension sourcery.sourcery && \
    code-server --install-extension streetsidesoftware.code-spell-checker && \
    code-server --install-extension tamasfe.even-better-toml && \
    code-server --install-extension timonwong.shellcheck && \
    code-server --install-extension tomoki1207.pdf && \
    code-server --install-extension wesbos.theme-cobalt2 && \
    code-server --install-extension wholroyd.jinja && \
    code-server --install-extension wix.vscode-import-cost && \
    code-server --install-extension yoavbls.pretty-ts-errors && \
    code-server --install-extension yzhang.markdown-all-in-one

####### USER #######
RUN git clone https://github.com/timmyb824/dotfiles_linux.git /home/coder/dotfiles_linux

USER coder
