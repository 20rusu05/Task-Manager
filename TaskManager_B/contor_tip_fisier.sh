#!/bin/bash

# functie pentru numararea fisierelor dupa extensii intr-un director
contor_tip_fisier() {
    echo "Introduceti calea directorului:"
    read dir

    # verifica daca directorul exista
    if [ ! -d "$dir" ]; then
        echo "Directorul nu exista."
        return 1 
    fi

    # listeaza fisierele din director, extrage extensiile si le numara
    ls "$dir" | awk -F. ' 
    # seteaza punctul (.) ca delimitator pentru a separa numele fisierului de extensie
    NF > 1 { ext[$NF]++ } # daca linia contine mai mult de un camp (are extensie), incrementeaza contorul pentru extensia respectiva
    END {
        # la sfarsit, parcurge toate extensiile gasite si afiseaza rezultatul
        for (e in ext) {
            print e ": " ext[e] # afiseaza extensia si numarul de aparitii
        }
    }'
}

