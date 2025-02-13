#!/bin/bash

afisare_fisiere_user_dimensiune() {
    echo "Introduceti calea directorului: "
    read dir

    # daca directorul exista
    if [ ! -d "$dir" ]; then
        echo "Directorul specificat nu există!"
        return 1
    fi

    # antetul în format tabelar
    printf "%-15s %-25s %-15s\n" "Dimensiune" "Nume fisier" "User"

    # fisierele cu detalii, le sortam si le afisam in format tabelar
    ls -l "$dir" | awk 'NR > 1 {
        printf "%-15s %-25s %-15s\n", $5, $9, $3
    }' | sort -k1 -n -r
   #sorteaza numeric -n dupa coloana 1 (dimensiunea) descrescator
}
