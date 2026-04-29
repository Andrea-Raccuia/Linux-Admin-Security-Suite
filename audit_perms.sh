#!/bin/bash

if [ $# -ne 1 ]; then
    echo "non hai inserito tutti i parametri necessari"
    exit 1
fi

if [ -d "$1" ]; then
    Res=$(find "$1" -type f -perm -002)
    if [ -z "$Res" ]; then
        echo "tutto apposto"
    else
        echo "ATTENZIONE, sono presenti file modificabili da chiunque"
        echo "$Res"
    fi
else
    echo "errore, cartella inesistente"
    exit 1
fi



