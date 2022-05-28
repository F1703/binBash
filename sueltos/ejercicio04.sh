#!/bin/bash

echo "Ingrese un numero del 1 al 10"
read numero
echo $numero

# verifico que se ingrese un numero
# if [ $# -eq 0 ]; then 
#     echo "No se ingreso ningun numero"
#     exit 1
# fi

# 1-10
if [ $numero -ge 1 ] && [ $numero -le 10 ]; then
    echo "TABLA DE MULTIPLICAR DEL $numero"
    echo "=================================="
    i=0
    for num in $(seq 1 1 12) ;do
        echo "$numero * $num = $(( $numero * $num))"
        i=$(expr $i + 1)
    done

else 
    echo "El numero ingresado no esta entre 1 y 10"
fi
 

exit 0