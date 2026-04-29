#!/bin/bash

SOGLIA=80

echo "inizio monitoraggio....."

ps -eo pid,pcpu --no-headers | while read -r line pid cpu; do
    cpu_int=${cpu%.*}
    if [[ "$cpu_int" -gt "$SOGLIA" ]]; then
        echo "processo pesante"
        kill -15 "$pid"
        echo "processo eliminato"
        echo "..."
    fi
done
echo "monitoraggio completato"
