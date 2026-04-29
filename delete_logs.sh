#!/bin/bash

# 1. Controllo parametri
if [[ "$#" -lt 2 ]]; then
    echo "Errore: Parametri insufficienti."
    echo "Utilizzo: $0 <directory> <pattern_file>"
    exit 1
fi

DIR="$1"
PATTERN="$2"

# 2. Controllo esistenza directory
if [[ -d "$DIR" ]]; then
    echo "Ricerca di file '$PATTERN' più vecchi di 7 giorni in: $DIR"
    
    # Mostra i file trovati
    find "$DIR" -name "$PATTERN" -mtime +7 -print

    # 3. Richiesta conferma
    read -r -p "Vuoi eliminare questi file? [1 per Sì, altro per No]: " var

    case "$var" in
        1) 
            find "$DIR" -name "$PATTERN" -mtime +7 -delete
            echo "File eliminati con successo."
        ;;
        *)
            echo "Operazione annullata dall'utente."
            exit 0
        ;;
    esac
else
    echo "Errore: La directory $DIR non esiste."
    exit 1
fi