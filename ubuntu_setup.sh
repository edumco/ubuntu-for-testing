#!/bin/bash

# Updates all apps

	sudo apt-get update && sudo apt-get upgrade --yes
	sudo apt-get autoremove --purge --yes # removes unused dependencies
	sudo apt-get autoclean --yes # removes downloaded files
	sudo snap set system refresh.retain=2 # reduce unused dependencies
	sudo snap refresh
	 
# Essential Packages

	sudo apt-get install --yes $(check-language-support) # Language Support
	sudo apt-get install --yes ubuntu-drivers-common # Third-party drivers
	sudo apt-get install --yes ubuntu-restricted-extras # Media codecs and fonts
	sudo apt-get install --yes gstreamer1.0-plugins-bad # Extra media codecs
	sudo apt-get install --yes curl wget # download tools used in scripts 
	sudo apt-get install --yes git git-doc # git
	
# Flatpak support

	sudo apt-get install --yes flatpak
	flatpak remote-add --user --if-not-exists \
	flathub https://flathub.org/repo/flathub.flatpakrepo

# DRA (Download Release Assets from GitHub) Helps installation directly from GitHub 

	# Helps installation directly from GitHub 
	curl --proto '=https' --tlsv1.2 -sSf \
	https://raw.githubusercontent.com/devmatteini/dra/refs/heads/main/install.sh \
	| bash -s -- --to "$HOME/.local/bin/dra"
	source ~/.profile

# Deb-get
	dra download --select *.deb https://github.com/wimpysworld/deb-get --output deb-get.deb
	sudo chmod +x deb-get.deb
	sudo dpkg --install deb-get.deb
	rm deb-get.deb
	deb-get update
	deb-get install topgrade

# AppImage apps support
	
	# Installs support for old AppImage apps 
	sudo apt-get --yes install libfuse2t64
	
	# Install AppManager (install and uninstall AppImages)
	dra download https://github.com/kem-a/AppManager \
		--select AppManager-{tag}-anylinux-x86_64.AppImage \
		--output "$HOME/app-manager"
		
	sudo chmod +x "$HOME/app-manager"
	sudo "$HOME/./app-manager" install "$HOME/app-manager"

# Alias 'update'
	
	# Make sure .bash_aliases exists
	touch "$HOME/.bash_aliases"
	
	# Adds 'update' alias
	echo "alias update=topgrade"
	
	# Reloads the bash session
	source "$HOME/.profile"
	source "$HOME/.bashrc"
	
	# Test the alias
	update 
