#!/bin/bash

# functia pentru eliminarea liniilor duplicate si inlocuirea numerelor de telefon
elimin_linii_duplicate_telefon() {
    echo "Introduceți numele fișierului: "
    read file

    # daca fisierul exista
    if [ ! -f "$file" ]; then
        echo "Fisierul specificat nu exista."
        return 1
    fi

    touch temp_file
    # elimina liniile duplicate
    sort "$file" | uniq > temp_file && mv temp_file "$file"

    # inlocuieste numerele de telefon direct in fisier
    sed -i -E 's/[0-9]{3}-[0-9]{3}-[0-9]{4}/<NR. TELEFON>/g' "$file"
    
    echo "S-au eliminat liniile duplicate si s-au inlocuit numerele de telefon cu <NR. TELEFON> cu succes" 
    
}

