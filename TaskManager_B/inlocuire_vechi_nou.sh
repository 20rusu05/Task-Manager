#!/bin/bash

inlocuire_vechi_nou() {
    echo "Introduceti calea catre director:"
    read dir

    # daca directorul exista
    if [ ! -d "$dir" ]; then
        echo "Directorul introdus nu exista."
        exit 1
    fi

    # cautam fișierele .txt modificate in ultimele 10 zile si inlocuim textul vechi cu nou
    find "$dir" -type f -name "*.txt" -mtime -10 | xargs sed -i 's/\bvechi\b/nou/g'

    echo "Inlocuirea a fost finalizata in fisierele din directorul: $dir"
}


