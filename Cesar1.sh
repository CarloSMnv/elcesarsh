#!/bin/bash

# Define la frase a cifrar y el desplazamiento o inserta un archivo para cifrar
read -p 'Presiona cualquier tecla para comenzar el cifrado, o presiona 1 para ingrear un archivo de origen  ‘ opt
if (( $opt== “1”))
then
     if [ ! -f $1 ]
     then
          echo "NO existe archivo de origen: $1"
     else
          
else
echo -n "Escribe lo que quieras cifrar "
read frase
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
