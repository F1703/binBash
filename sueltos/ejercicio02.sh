#!/bin/bash

# Cree un shell script, que devuelva el numero de argumentos con el que ha sido llamado.
# Devolvera 0 (exito) si se ha pasado algun arugmento y 1 (error) en caso contrario.
# Mejorar este shell de forma que muestre una lista de todos los argumentos pasados o bien que indique que no tiene argumentos.


# si no se paso ningun argumento salida no exitosa (exit 1)
if [ $# -eq 0 ]; then
    echo "No se ingreso ningun argumento"
    exit 1
fi


# si se paso argumentos
numero=0; 
for args in $*; do
    echo "Argumento $numero: $args "
    numero=$(expr $numero + 1)
done

 

# i=0
# while [ $i -lt 5 ] 
# do
#     echo $i
#     i=$(expr $i + 1)
# done