#!/bin/bash

# functie pt stergere fisier citit de user
stergere_fisiere() {
    echo "Introduceti calea fisierului pe care doriti sa-l stergeti:"
    read cale_fisier
    #daca fisierul exista
    if [ -f "$cale_fisier" ]; then
        rm "$cale_fisier"
        echo "Fisierul $cale_fisier a fost sters."
    #daca fisierul nu exista 
    else
        echo "Fisierul nu exista: $cale_fisier"
    fi
}

