#!/bin/bash
# Exemplo de como passar parãmetros nomeados para o script shell
# ./getopts.sh -f 123 -l 987

while getopts ":f:l:" opt; do
  case ${opt} in
    f )
      firstnum=$OPTARG
      echo $firstnum
      ;;
    l )
      lastnum=$OPTARG
      echo $lastnum
      ;;
    \? )
      echo "Uso: getopts [-f] [-l]"
      ;;
    : )
      echo "Opção Inválida: $OPTARG requer um argumento" 1>&2
      ;;
  esac
done
shift $((OPTIND -1))
