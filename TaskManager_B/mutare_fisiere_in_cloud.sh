#!/bin/bash

mutare_fisiere_in_cloud() {
    # cere utilizatorului numele fisierului care trebuie mutat in cloud
    echo "Introduceti numele fisierului pe care doriti sa il mutati in cloud:"
    read file

    # verifica daca fisierul introdus exista in directorul curent
    if [[ ! -f "$file" ]]; then
        echo "Fisierul '$file' nu exista. Iesire."
        return 1
    fi

    # verifica daca directorul 'repo' exista; daca nu, il creeaza si configureaza git
    if [[ ! -d "repo" ]]; then
        echo "Directorul 'repo' nu exista. Creare..."
        mkdir repo                           # creeaza directorul 'repo'
        cd repo                             # schimba directorul curent in 'repo'
        git init                            # initializeaza un repository git in 'repo'
        git remote add origin https://github.com/123alexandra123/my-repo.git # adauga remote-ul github
    else
        cd repo                             # schimba directorul curent in 'repo' daca exista deja
    fi

    # verifica daca remote-ul github este configurat; daca nu, il configureaza
    remote_url=$(git remote get-url origin 2>/dev/null)
    if [[ -z "$remote_url" ]]; then
        echo "Remote-ul GitHub nu este configurat. Configurare..."
        git remote add origin https://github.com/123alexandra123/my-repo.git
    fi

    # muta fisierul specificat de utilizator in directorul 'repo'
    mv "../$file" .

    # adauga fisierul in zona de staging a git
    git add "$file"

    # creeaza un commit cu mesajul care descrie adaugarea fisierului
    git commit -m "Adaugat fisierul $file"

    # trimite commit-ul catre repository-ul remote de pe github
    if ! git push; then
        echo "Eroare la trimiterea catre GitHub. Verificati autentificarea."
        return 1
    fi

    # afiseaza un mesaj de succes daca fisierul a fost trimis cu succes
    echo "Fisierul '$file' a fost mutat si trimis cu succes in repository-ul GitHub."
    return 0
}

