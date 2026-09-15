#!/bin/bash

# pnpm (Manages runtimes: node, bun, deno) 
curl -fsSL https://get.pnpm.io/install.sh | sh -
source ~/.bashrc

# Installs node globally (latest LTS) 
pnpm runtime set node lts -g

# Installs TypeScript globally (latest stable)
pnpm install -y -g -D typescript

echo "pnpm self-update && pnpm update -g && pnpm prune" >> $HOME/.update.sh


