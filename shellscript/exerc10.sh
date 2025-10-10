#!/bin/bash
IP=$1

RED=$(tput setaf 1)   # Vermelho
GREEN=$(tput setaf 2) # Verde
BLUE=$(tput setaf 4)  # Azul
RESET=$(tput sgr0)    # Reseta as cores e atributos

if ping -c 1 "$IP" > /dev/null 2>&1; then
    echo "O endereço ${BLUE}$IP${RESET} está ${GREEN}online.${RESET}"
else
    echo "O endereço ${BLUE}$IP${RESET} está ${RED}offline.${RESET}"
fi
