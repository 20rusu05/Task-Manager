#!/bin/bash

# functie pentru configurarea stergerii periodice
configurare_stergere_periodica() {
    echo "Introduceti calea directorului in care doriti sa stergeti fisiere mai vechi de 60 de zile:"
    #se citeste calea directorului 
    read dir
    #daca exista directorul
    if [ -d "$dir" ]; then
        #se creeaza cronjobul dupa cerinta
        cron_job="0 20 * * 1 find \"$dir\" -type f -mtime +60 -exec rm -f {} \\;"
        #se adauga cronjobul  in crontab
        (crontab -l 2>/dev/null; echo "$cron_job") | crontab -
        #mesaj de confirmare
        echo "Sarcina configurata cu succes: fisierele mai vechi de 60 de zile din $dir vor fi sterse lunea la ora 20:00."
    else
    #daca nu exista acel director
        echo "Directorul specificat nu exista: $dir"
    fi
}



