#!/bin/bash

# shellcheck disable=SC1009,SC1083,SC1091,SC2046,SC2250

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
	sudo apt-get install --yes curl wget # download tools used in scripts 
	sudo apt-get install --yes git git-doc # git

# Flatpak support

	sudo apt-get install --yes flatpak
	flatpak remote-add --user --if-not-exists \
	flathub https://flathub.org/repo/flathub.flatpakrepo

# DRA (Download Release Assets from GitHub) Helps installation directly from GitHub 

	curl --silent --show-error --fail --proto '=https'\
		--location https://raw.githubusercontent.com/devmatteini/dra/refs/heads/main/install.sh \
		--output install.sh 

	bash install.sh --to "$HOME/.local/bin/dra"

	sudo ln -s "$HOME/.local/bin/dra" /usr/local/bin/dra

	source "$HOME/.profile"

# AppImage apps support
	
	# Installs support for old AppImage apps 
	sudo apt-get --yes install libfuse2t64
	
	# Install AppManager (install and uninstall AppImages)
	sudo dra download https://github.com/kem-a/AppManager \
		--select AppManager-{tag}-anylinux-x86_64.AppImage \
		--output "$HOME/app-manager" \
		--install

# Deb-get (selected packages in debian format)

	sudo dra download https://github.com/wimpysworld/deb-get \
		--select deb-get_{tag}-1_all.deb \
		--output "$HOME/deb-get.deb" \
		--install

	deb-get update # populates the deb-get database with all available packages

# Topgrade (Detects and updates all package managers of your machine

	deb-get install topgrade

# Alias 'update' (An easy command to use everyday)
	
	# Make sure .bash_aliases exists
	touch "$HOME/.bash_aliases"
	
	# Adds 'update' alias
	echo "alias update=topgrade --yes"
	
	# Reloads the bash session
	source "$HOME/.profile"
	source "$HOME/.bashrc"
	
	# Test the alias
	update 
