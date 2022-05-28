#!/bin/bash

# Crear un shel script que devuelva el numero de ficheros de cada tipo que hay en un directorio, asi como los nombres de estos ficheros.
# Tendra un unico argumento que sera el directorio a explorar.
# si se omite el direcotiro se considera el direcotorio actual.


if [ $# -eq 0 ]; then
    echo " Por favor ingrese direcctorio."
    exit 1
fi


$(rm -fr /tmp/archivos.txt && touch /tmp/archivos.txt)
for ff in $(ls $1); do
    echo $( file $1/$ff | cut -d " " -f2 )
    $( file $1/$ff | cut -d " " -f2 >> /tmp/archivos.txt)
done
wait
echo $( cat /tmp/archivos.txt |sort | uniq -c | awk '{print "Hay " $1 " ficheros de : " $2 "\n"}'   ) 

