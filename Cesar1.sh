#!/bin/bash

# Define la frase a cifrar y el desplazamiento o inserta un archivo
# echo -n “Si quieres cifrar un archivo oprime 1, si no, inserta escribe la frase que quieras cifrar : “
# read anr
# if [ ! -f $1]
# then 
frase="HOLA MUNDO"
desplazamiento=3

# Convierte la frase a mayúsculas
frase=`echo $frase | tr '[:lower:]' '[:upper:]'`

# Cifra la frase usando el cifrado César
cifrado=""
for((i=0;i<${#frase};i++))
do
  char=${frase:$i:1}
  # Si el carácter es una letra, cifralo
  if [[ "$char" =~ [A-Z] ]]; then
    ascii=$(printf "%d" "'$char")
    ascii=$((ascii-65+desplazamiento))
    ascii=$((ascii%26+65))
    char=$(printf \\$(printf '%03o' $ascii))
  fi
  cifrado+="$char"
done

# Muestra el resultado
echo "Frase original: $frase"
echo "Frase cifrada: $cifrado"
