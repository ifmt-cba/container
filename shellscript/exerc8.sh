#!/bin/bash
# EXERCICIO 8

DAY=$(date +%F)

for FILE in $(ls *.png)
do
  mv $FILE ${DAY}-${FILE}
done
