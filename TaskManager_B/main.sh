#!/bin/bash

# includem functiile din fisiere
source ./cautare_fisiere.sh
source ./mutare_fisiere_local.sh
source ./stergere_fisiere.sh
source ./configurare_stergere_periodica.sh
source ./redenumire_fisiere.sh
source ./editare_fisiere.sh
source ./ajutor.sh
source ./mutare_fisiere_in_cloud.sh
source ./elimin_linii_duplicate_telefon.sh
source ./contor_tip_fisier.sh
source ./afisare_fisiere_user_dimensiune.sh
source ./permisiuni_json.sh
source ./inlocuire_vechi_nou.sh


# se creeaza si se initializeaza fisierul de locuri pt debug
touch out.log
fisier_log="out.log"

# se initializeaza variabila pt debug cu 0 pt ca e initial dezactivat
debug_mod=0



# procesam optiuni din linia de comanda folosind getopt
ARGS=$(getopt -o hu -l help,usage,debug: -- "$@")

# aranjare argumente conform getopt
eval set -- "$ARGS"

# procesarea optiunilor de pe linia de comanda
while true; do
    case "$1" in
        -h|--help)   #daca e primul argument -h sau --help se apeleaza funtia de ajutor
            afisare_ajutor
            shift
            exit 0
            ;;
        -u|--usage)  #daca e primul argument -u sau --usage se apeleaza funtia de usage
            afisare_usage
            shift
            exit 0
            ;;
        --debug)    #daca e primul argument --debug se intra pe 2 cazuri 
            case "$2" in
                on)   #daca debug=on atunci se seteaza variabila debug_mod=1
                    debug_mod=1
                    ;;
                off)  ##daca debug=off atunci se seteaza variabila debug_mod=0
                    debug_mod=0
                    ;;
                *)
                    echo "Valoare necunoscuta pentru debug: $2"
                    exit 1
                    ;;
            esac
            shift 2
            ;;
        --)
            shift
            break
            ;;
        *)
            echo "Optiune necunoscuta: $1"
            exit 1
            ;;
    esac
done

# mesaj debug daca este activat
if [[ $debug_mod -eq 1 ]]; then
    echo "Modul debug este activat."
else  
    echo "Modul debug este dezactivat."
fi

# functie pentru afisarea meniului
afisare_meniu() {
    echo "Selectati o optiune:"
    echo "1. Gasire fisiere mai vechi de o anumita data"
    echo "2. Mutare fisiere local"
    echo "3. Mutare fisiere in cloud"
    echo "4. Stergere fisiere"
    echo "5. Configurare stergere periodica"
    echo "6. Redenumire fisiere"
    echo "7. Editare continut fisiere"
    echo "8. Eliminare linii duplicate si inlocuire nr telefon"
    echo "9. Contorizare tipuri de fisiere"
    echo "10. Afisare fisiere cu user si dimensiune, sortare"
    echo "11. Afisare permisiuni fisiere in format json."
    echo "12. Inlocuirea cuvantului vechi cu nou in fisierele txt modificate in ultimele 10 zile"
    echo "13. Afisare ajutor"
    echo "14. Iesire"
}

# bucla pt afisare meniu principal
while true; do
    afisare_meniu
    echo "Selectati optiunea dorita: "
    read optiune
    case $optiune in
        1)
            [[ $debug_mod -eq 1 ]] && echo "[DEBUG] Execut cautare_fisiere" >> "$fisier_log"
            cautare_fisiere
            ;;
        2)
            [[ $debug_mod -eq 1 ]] && echo "[DEBUG] Execut mutare_fisiere_local" >> "$fisier_log"
            mutare_fisiere_local
            ;;
        3)
            [[ $debug_mod -eq 1 ]] && echo "[DEBUG] Execut mutare_fisiere_in_cloud" >> "$fisier_log"
            mutare_fisiere_in_cloud 
            ;;
        4)
            [[ $debug_mod -eq 1 ]] && echo "[DEBUG] Execut stergere_fisiere" >> "$fisier_log"
            stergere_fisiere 
            ;;
        5)
            [[ $debug_mod -eq 1 ]] && echo "[DEBUG] Execut configurare_stergere_periodica" >> "$fisier_log"
            configurare_stergere_periodica 
            ;;
        6)
            [[ $debug_mod -eq 1 ]] && echo "[DEBUG] Execut redenumire_fisiere" >> "$fisier_log"
            redenumire_fisiere 
            ;;
        7)
            [[ $debug_mod -eq 1 ]] && echo "[DEBUG] Execut editare_fisiere" >> "$fisier_log"
            editare_fisiere 
            ;;
        8)
            [[ $debug_mod -eq 1 ]] && echo "[DEBUG] Execut elimin_linii_duplicate_telefon" >> "$fisier_log"
            elimin_linii_duplicate_telefon
            ;;
        9)
            [[ $debug_mod -eq 1 ]] && echo "[DEBUG] Execut contor_tip_fisier" >> "$fisier_log"
            contor_tip_fisier
            ;;
        10)
            [[ $debug_mod -eq 1 ]] && echo "[DEBUG] Execut afisare_fisiere_user_dimensiune" >> "$fisier_log"
            afisare_fisiere_user_dimensiune
            ;;
        11)
            [[ $debug_mod -eq 1 ]] && echo "[DEBUG] Execut permisiuni_json" >> "$fisier_log"
            permisiuni_json
            ;;
        12)
            [[ $debug_mod -eq 1 ]] && echo "[DEBUG] Execut inlocuire_vechi_nou" >> "$fisier_log"
            inlocuire_vechi_nou
            ;;
        13)
            afisare_ajutor
            ;;
        14)
            echo "Iesire."
            break
            ;;
        *)
            echo "Optiune invalida."
            ;;
    esac
done

