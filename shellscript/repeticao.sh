#!/bin/bash

echo "Laço de repetição for:"
for i in {1..5}; do
    echo "Contagem: $i"
done

echo "Laço de repetição while"
contador=1
while [ $contador -le 5 ]; do
    echo "Contador: $contador"
    contador=$((contador + 1))
done
