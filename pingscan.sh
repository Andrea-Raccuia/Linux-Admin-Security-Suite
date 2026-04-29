#!/bin/bash

check_host() {
    local target=$1

    if ping -c 1 -W 1 "$target" > /dev/null 2>&1; then
        echo -e "ONLINE $target" >> reportrete.txt
    else
        echo -e "OFFLINE $target" >> reportrete.txt
    fi
}

read -r -p "file host: " HOST_FILE

if [[ ! -f "$HOST_FILE" ]]; then
    echo "Errore: Il file $HOST_FILE non esiste."
    exit 1
fi

echo "--- Inizio Scansione Rete ---"
while read -r line; do

    [[ -z "$line" ]] && continue
    
    check_host "$line"
done < "$HOST_FILE" 
echo "Scansione del $(date)" >> reportrete.txt
 

echo "--- Scansione completata ---"