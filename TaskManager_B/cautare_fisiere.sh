#!/bin/bash

# functie pt gasire fisiere dupa o anumita data
cautare_fisiere() {
    echo "Introduceti data (ex: 1 ani, 10 luni, 3 saptamani, 4 zile sau similar):"
    read data_utilizator

    # se ia cu grep si expresii regulate nr de ani, luni, saptamani, zile
    ani=$(echo "$data_utilizator" | grep -Eo '[0-9]+ ani' | grep -Eo '[0-9]+' || echo 0)
    luni=$(echo "$data_utilizator" | grep -Eo '[0-9]+ luni' | grep -Eo '[0-9]+' || echo 0)
    saptamani=$(echo "$data_utilizator" | grep -Eo '[0-9]+ saptamani' | grep -Eo '[0-9]+' || echo 0)
    zile=$(echo "$data_utilizator" | grep -Eo '[0-9]+ zile' | grep -Eo '[0-9]+' || echo 0)

    # se transforma totul intr-un total de zile
    zile_totale=$((ani * 365 + luni * 30 + saptamani * 7 + zile))

    echo "Introduceti directorul in care doriti sa cautati fisiere:"  
    read dir

    if [[ ! -d "$dir" ]]; then
        echo "Directorul specificat nu exista."
        return 1
    fi

    echo "Se vor cauta fisiere mai vechi decat $zile_totale zile in directorul $dir."

    # se gasesc fisierele respective si se afiseaza
    find "$dir" -type f -mtime +$zile_totale -print
}
