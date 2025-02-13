#!/bin/bash

permisiuni_json() {
  echo "Introduceti calea catre director: "
  read dir

  # daca directorul specificat exista
  if [[ ! -d "$dir" ]]; then
    echo "Directorul specificat nu exista."
    return 1
  fi

  echo "{" > permisiuni.json

  # parcurgem toate fisierele din director
  for file in "$dir"/*; do
    # obtinem permisiunile fisierului in format simbolic
    perms=$(stat -c %A "$file")

    # obtinem numele fisierului
    filename=$(basename "$file")

    # extragem permisiunile pentru utilizator (u), grup (g), other (o)
    u_perms=$(echo $perms | cut -c2-4 | tr '-' ' ')
    g_perms=$(echo $perms | cut -c5-7 | tr '-' ' ')
    o_perms=$(echo $perms | cut -c8-10 | tr '-' ' ')
    # -rwx rwx rwx-

    # transformam permisiunile intr-un format bun pt fisierele de tip json
    u_set=$(echo $u_perms | sed 's/ /","/g')
    g_set=$(echo $g_perms | sed 's/ /","/g')
    o_set=$(echo $o_perms | sed 's/ /","/g')

    # adaugam informatiile despre fisier in json
    echo "  \"$filename\": {" >> permisiuni.json
    echo "    \"u\": [\"$u_set\"]," >> permisiuni.json
    echo "    \"g\": [\"$g_set\"]," >> permisiuni.json
    echo "    \"o\": [\"$o_set\"]" >> permisiuni.json
    echo "  }," >> permisiuni.json
  done

  # eliminam ultima virgula si inchidem jsonul
  sed -i '$ s/,$//' permisiuni.json
  echo "}" >> permisiuni.json

  echo "Permisiunile au fost salvate in permisiuni.json"
  #afisare fisier json la stdout
  cat permisiuni.json
} 
