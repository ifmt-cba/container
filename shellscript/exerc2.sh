#!/bin/bash
#EXERCICIO 2

FILE="/home/jppreti/git/ifmt-cba/container/README.md"
if [ -e $FILE ]
  then
     echo "O caminho $FILE está habilitado!"    
 if  [ -r $FILE -a -w $FILE ]
     then
         echo "Você tem permissão para editar $FILE"
     else
         echo "Você NÃO foi autorizado a editar $FILE"
     fi    
 fi
