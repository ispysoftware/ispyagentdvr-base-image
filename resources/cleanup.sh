#!/bin/bash

# Exit on error and print each command for debugging
set -ex

echo "****		Removing Residue Files, Folders. Cleaning up the Image		****"
apt-get purge gnupg2 -y --autoremove --allow-remove-essential
rm -vrf /etc/apt/sources.list.d/sid.sources /etc/apt/sources.list.d/backports.sources
rm -vrf /etc/apt/preferences.d/sid-pinning
rm -vrf /var/lib/apt/lists/*
apt-get clean autoclean -y
apt-get autoremove -y
echo "****      Everything is Nice & Tidy     ****"
echo "**** Exiting SETUP ****"