#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Використання: $0 <ім'я_файлу.csv>"
    exit 1
fi

INPUT_FILE="$1" 
gawk script.awk "$INPUT_FILE"
