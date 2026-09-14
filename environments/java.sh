#!/bin/bash

# SDKMAN
curl -s "https://get.sdkman.io" | bash

# Latest stable java from OpenJDK
sdk install java

# Adds update and cleanup
echo "sdk update && sdk selfupdate && sdk upgrade java && sdk flush" >> $HOME/.update.sh

