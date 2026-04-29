#!/bin/bash

DESTINAZIONE="destinazione"

read -r -p "Inserisci il path della cartella: " car

if [[ ! -d "$car" ]]; then
    echo "Errore: '$car' non è una directory valida." >&2
    exit 1
fi

echo "Trasferimento in corso verso Windows..."
if scp -r "$car" "$DESTINAZIONE"; then
    echo "Copia completata con successo!"
else
    echo "Errore critico durante il trasferimento SCP." >&2
    exit 1
fi

