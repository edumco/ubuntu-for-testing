#!/bin/bash

# Snaps have a better terminal integration
snap install code

# Format shell code
code --install-extension mads-hartmann.bash-ide-vscode
code --install-extension mkhl.shfmt

# Spell checker
code --install-extension streetsidesoftware.code-spell-checker

# Brasil PT 🇧🇷
code --install-extension streetsidesoftware.code-spell-checker-portuguese-brazilian

# Run code easily inside a container
code --install-extension ms-vscode-remote.remote-containers

# Test Explorer
# Download the especific adpater for you project
# https://marketplace.visualstudio.com/items?itemName=hbenl.vscode-test-explorer
# There are specific test explorer that can be more efficient on your project 
code --install-extension hbenl.vscode-test-explorer
