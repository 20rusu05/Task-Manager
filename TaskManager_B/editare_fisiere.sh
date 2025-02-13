#!/bin/bash

# functie pentru editarea continutului fisierelor
editare_fisiere() {
    echo "Introduceti numele fisierului pe care doriti sa il editati:"
    read fisier_editat
    #daca fisierul exista
    if [ -f "$fisier_editat" ]; then
        echo "Introduceti linia pe care doriti sa o adaugati in fisier:"
        #citire linie de adaugat la finalul fisierului
        read linie_noua
        #adaugare linie 
        echo "$linie_noua" >> "$fisier_editat"
        echo "Linia a fost adaugata in fisierul $fisier_editat."
    #daca fisierul nu exista
    else
        echo "Fisierul specificat nu exista: $fisier_editat"
    fi
}

