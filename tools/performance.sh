#!/bin/bash

# Performance Monitor (Similar to Windows System Monitor)
sudo apt-get install --yes lm-sensors # dependency
flatpak install --assumeyes flathub io.missioncenter.MissionCenter

# Apache JMeter (api performance)
flatpak install --assumeyes org.apache.jmeter

