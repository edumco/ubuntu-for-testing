#!/bin/bash

# Screnshot and Screen record
sudo apt-get install --yes kazam # Screen Recorder

# Video player
flatpak install --assumeyes org.videolan.VLC

# Video Editor
flatpak install --assumeyes org.openshot.OpenShot

# Audio Editor
flatpak install --assumeyes org.audacityteam.Audacity

# Video Compressor
flatpak install --assumeyes fr.handbrake.ghb \
fr.handbrake.ghb.Plugin.dvdcss \
fr.handbrake.ghb.Plugin.IntelMediaSDK
