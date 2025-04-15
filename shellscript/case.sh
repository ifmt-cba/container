#!/bin/sh

echo "Escolha uma cor (vermelho, azul ou verde): "
read cor
case $cor in
    vermelho)
        echo "Você escolheu vermelho!"
        ;;
    azul)
        echo "Você escolheu azul!"
        ;;
    verde)
        echo "Você escolheu verde!"
        ;;
    *)
        echo "Cor desconhecida!"
        ;;
esac
