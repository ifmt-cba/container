#!/bin/bash
# EXERCICIO 3

echo "Digite o caminho de um arquivo ou diretório:"
read FILE
if [ -f "$FILE" ]
then
  echo "$FILE é um arquivo comum"
elif [ -d "$FILE" ]
then
  echo "$FILE é um diretório"
else
  echo "$FILE é alguma outra coisa"
fi

ls -l $FILE
