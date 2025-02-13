#!/bin/bash

# functie pt mutare fisiere
mutare_fisiere_local() {
    echo "Introduceti calea fisierului pe care doriti sa il mutati:"
    #se citeste fisierul sursa (care trebuie mutat)
    read fisier_sursa
    #daca fisierul exista
    if [ -f "$fisier_sursa" ]; then
        echo "Introduceti locatia destinatie:"
        #se citeste directorul destinatie
        read locatie_destinatie
        #daca nu exista fisierul destinatie se creeaza 
        mkdir -p "$locatie_destinatie"
        #se muta
        mv "$fisier_sursa" "$locatie_destinatie"
        echo "Fisierul $fisier_sursa a fost mutat in $locatie_destinatie."
    #daca fisierul nu exista
    else
        echo "Fisierul specificat nu exista: $fisier_sursa"
    fi
}

