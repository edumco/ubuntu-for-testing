#!/bin/bash

# Updates all apps


	# Deb packages
	sudo apt-get update && sudo apt-get upgrade --yes
	sudo apt-get autoremove --purge --yes # removes unused dependencies
	sudo apt-get autoclean --yes # removes downloaded files
	
	# Snap packages
	sudo snap set system refresh.retain=2 # reduce unused dependencies
	sudo snap refresh
	 
# Essential Packages

	sudo apt-get install --yes $(check-language-support) # Language Support
	sudo apt-get install --yes ubuntu-drivers-common # Third-party drivers
	sudo apt-get install --yes ubuntu-restricted-extras # Media codecs and fonts
	sudo apt-get install --yes gstreamer1.0-plugins-bad # Extra media codecs
	sudo apt-get install --yes curl wget # download tools used in scripts 
	
# Flatpak support

	sudo apt-get install --yes flatpak
	flatpak remote-add --user --if-not-exists \
	flathub https://flathub.org/repo/flathub.flatpakrepo

# DRA (Download Release Assets from GitHub)

	# Helps installation directly from GitHub 
	curl --proto '=https' --tlsv1.2 -sSf \
	https://raw.githubusercontent.com/devmatteini/dra/refs/heads/main/install.sh \
	| bash -s -- --to $HOME/.local/bin

# AppImage apps support
	
	# Installs support for old AppImage apps 
	sudo apt-get --yes install libfuse2t64
	
	# Install AppManager (install and uninstall AppImages)
	dra download https://github.com/kem-a/AppManager \
		--select AppManager-{tag}-anylinux-x86_64.AppImage \
		--output $HOME/app-manager && \
		sudo chmod +x $HOME/app-manager &&
		$HOME/./app-manager install $HOME/app-manager

# Alias 'update'
	
	# Creates a script file on the HOME folder 
	touch $HOME/.update.sh
	sudo chmod +x $HOME/.update.sh

	# Adds all update commands
	
	# Debs
	echo "sudo apt-get update && sudo apt-get upgrade --yes" >> $HOME/.update.sh
	echo "sudo apt-get autoremove --purge --yes" >> $HOME/.update.sh
	echo "sudo apt-get autoclean --yes" >> $HOME/.update.sh
	
	# Snaps
	echo "sudo snap refresh" >> $HOME/.update.sh
	
	# Flatpak
	echo "flatpak update" >> $HOME/.update.sh
	echo "flatpak uninstall --unused" >> $HOME/.update.sh
	
	# AppImage
	echo "app-manager --update-all" >> $HOME/.update.sh
	
	# Make sure .bash_aliases exists
	touch $HOME/.bash_aliases
	
	# Adds 'update' alias
	echo "alias update='$HOME/./.update.sh'" >> $HOME/.bash_aliases
	
	# Reloads the bash session
	source $HOME/.bashrc
	
	# Test the alias
	update 
