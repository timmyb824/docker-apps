#!/usr/bin/env bash

EXTENSIONS_DIR="/config/workspace/DEV/temp/extensions"
VSCODE_BIN="/app/code-server/lib/vscode/bin/remote-cli/code-server"

# Function to install a single extension and handle output
install_extension() {
    local extension=$1
    local output
    cd "$EXTENSIONS_DIR" || exit
    output=$($VSCODE_BIN --install-extension "$extension" 2>&1)
    echo "$output"
    if echo "$output" | grep -q "not found"; then
        echo "Failed to install $extension"
        echo "$output"
    else
        echo "Successfully installed $extension"
    fi
}

# Iterate over the .vsix files in the extensions directory and install each one
for extension in "$EXTENSIONS_DIR"/*.vsix; do
    install_extension "$extension"
done
