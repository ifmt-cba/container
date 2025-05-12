#!/bin/bash
# EXERCICIO 5

DIRECTORY=$1
if [ -d "$DIRECTORY" ]
then
  FILES=`ls -l $DIRECTORY | wc -l`
  echo "O $DIRECTORY tem $FILES arquivos."
else
  echo "O argumento $DIRECTORY não é um diretório!"
fi
