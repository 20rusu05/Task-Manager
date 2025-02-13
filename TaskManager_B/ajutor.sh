# functie pentru afisarea ajutorului
afisare_ajutor() {
    echo "Optiuni disponibile:"
    echo "-h sau --help          Afisare ajutor"
    echo "-u sau --usage         Modul de utilizare"
    echo "--debug=on             Activare mod debug"
    echo "--debug=off            Dezactivare mod debug (implicit)"
}

# functie pentru afisarea modului de utilizare
afisare_usage() {
    echo "Utilizare:"
    echo "./main.sh [optiuni]"
    echo "Exemplu:"
    echo "  ./main.sh --debug=on"
    echo "  ./main.sh -h"
}
