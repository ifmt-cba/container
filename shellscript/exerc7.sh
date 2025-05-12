#!/bin/bash
# EXERCICIO 7

FILES=$@

for FILE in $FILES
do
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
done
