#!/bin/bash
ARQUIVO=$1

if [ ! -f "$ARQUIVO" ]; then
  echo "Erro: o arquivo '$ARQUIVO' não foi encontrado!"
  exit 1
fi

RED=$(tput setaf 1)   # Vermelho
GREEN=$(tput setaf 2) # Verde
BLUE=$(tput setaf 4)  # Azul
RESET=$(tput sgr0)    # Reseta as cores e atributos
arquivoff=$(date "+offline-%F-%H-%M.log")
arquivon=$(date "+online-%F-%H-%M.log")

while IFS= read -r IP; do
    if ping -c 1 "$IP" > /dev/null 2>&1; then
        echo $IP >> $arquivon
        echo "O endereço ${BLUE}$IP${RESET} está ${GREEN}online.${RESET}"
    else
        echo $IP >> $arquivoff
        echo "O endereço ${BLUE}$IP${RESET} está ${RED}offline.${RESET}"
    fi
done < "$ARQUIVO"


