#!/bin/bash

# functie pentru redenumirea fisierelor
redenumire_fisiere() {
    echo "Introduceti numele fisierului pe care doriti sa il redenumiti:"
    read fisier_original
    #daca fisierul exista
    if [ -f "$fisier_original" ]; then
        echo "Introduceti noul nume pentru fisier:"
        #citire nume nou fisier
        read fisier_nou
        #redenumirea
        mv "$fisier_original" "$fisier_nou"
        echo "Fisierul $fisier_original a fost redenumit in $fisier_nou."
    else
    #daca fisierul nu exista
        echo "Fisierul specificat nu exista: $fisier_original"
    fi
}

