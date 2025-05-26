#!/usr/bin/env bash
# ------------------------------------------------------------------------ #
# Script Name:   update-system.sh
# Description:   Update the systems
# Site:          https://amaurybsouza.medium.com/
# Written by:    Amaury Souza
# Maintenance:   Amaury Souza
# ------------------------------------------------------------------------ #
# Usage:
#       $ ./system-backup.sh
# ------------------------------------------------------------------------ #
# Tested on:
#       Bash 4.2.46
# ------------------------------------------------------------------------ #
# History:        v1.0 22/04/2023, Amaury:
#                - start de program
#                - add bash commands
#                v1.1 23/04/2022, Amaury:
#                - code review
#                v1.2 23/04/2023, Amaury:
#                - check the applicability
# ------------------------------------------------------------------------ #
# Thankfulness: 
#
#VARIABLES --------------------------------------------------------------- #
#
#FUNCTIONS
#
#CODE
sudo apt update ; apt upgrade -y
sudo apt list --upgradable
sudo apt  autoremove -y
sudo apt clean
echo "System update completed!"
#END --------------------------------------------------------------------- #
