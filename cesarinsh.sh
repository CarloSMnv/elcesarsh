#!/bin/bash

# Número de posiciones de desplazamiento
offset=3

# Alfabeto
alphabet="abcdefghijklmnopqrstuvwxyz"

# Función para cifrar una letra
function encrypt_letter {
  letter=$1
  index=$(echo "$alphabet" | grep -ob "$letter" | cut -d: -f1)
  new_index=$(($index + $offset))
  if [ $new_index -gt 25 ]; then
    new_index=$(($new_index - 26))
  fi
  echo "${alphabet:$new_index:1}"
}

# Función para cifrar una línea de texto
function encrypt_line {
  line=$1
  encrypted=""
  for (( i=0; i<${#line}; i++ )); do
    char="${line:$i:1}"
    encrypted="$encrypted$(encrypt_letter "$char")"
  done
  echo "$encrypted"
}

# Mostrar menú de opciones
echo "Elige una opción:"
echo "1. Cifrar archivo"
echo "2. Cifrar frase"
read -p "Opción: " option

# Elegir opción
if [ $option == 1 ]; then
  # Cifrar archivo
  read -p "Ingresa el nombre del archivo: " file
  while read -r line; do
    encrypted_line=$(encrypt_line "$line")
    echo "$encrypted_line"
  done < "$file"
else
  # Cifrar frase
  read -p "Ingresa la frase a cifrar: " line
  encrypted_line=$(encrypt_line "$line")
  echo "$encrypted_line"
fi
