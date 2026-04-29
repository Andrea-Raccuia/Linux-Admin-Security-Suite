#!/bin/bash


LOG_FILE="/var/log/auth.log"

if [[ $EUID -ne 0 ]]; then
   echo "Errore: Questo script deve essere eseguito come root (usa sudo)."
   exit 1
fi

if [[ ! -f "$LOG_FILE" ]]; then
    echo "Errore: $LOG_FILE non trovato o non leggibile."
    exit 1
fi

echo "--------------------------------------------------"
echo "REPORT SICUREZZA: Tentativi di Login Falliti"
echo "Data: $(date)"
echo "--------------------------------------------------"
echo "  Conteggio   |   Indirizzo IP"
echo "--------------------------------------------------"

grep "Failed password" "$LOG_FILE" | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr | head -n 10

echo "--------------------------------------------------"