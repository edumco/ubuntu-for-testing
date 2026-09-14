#!/bin/bash

curl -LsSf https://astral.sh/uv/install.sh | sh
uv python install
touch ~/.bash_aliases
echo "alias python='$(uv python find)'" >> ~/.bash_aliases
echo "uv self update && 	uv python upgrade && cache prune" >> ~/.update.sh

