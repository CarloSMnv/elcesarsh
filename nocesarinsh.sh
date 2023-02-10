#!/bin/bash

# Nombre del archivo cifrado
file="cifrado.txt"

# Número de posiciones de desplazamiento (debe ser negativo para descifrar)
offset=-3

# Alfabeto
alphabet="abcdefghijklmnopqrstuvwxyz"

# Función para descifrar una letra
function decrypt_letter {
  letter=$1
  index=$(echo "$alphabet" | grep -ob "$letter" | cut -d: -f1)
  new_index=$(($index + $offset))
  if [ $new_index -lt 0 ]; then
    new_index=$(($new_index + 26))
  fi
  echo "${alphabet:$new_index:1}"
}

# Leer el archivo cifrado y descifrar cada línea
while read -r line; do
  decrypted=""
  for (( i=0; i<${#line}; i++ )); do
    char="${line:$i:1}"
    decrypted="$decrypted$(decrypt_letter "$char")"
  done
  echo "$decrypted"
done < "$file"
