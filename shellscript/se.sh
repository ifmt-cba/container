#!/bin/sh
clear
echo "Digite um número: "
read a
echo "Digite outro número: "
read b

if [ $a -gt $b ]; then
    echo "$a é maior que $b"
else
    echo "$a é menor ou igual a $b"
fi
