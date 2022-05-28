#! /bin/bash

# echo $#
# exit 0


function menu {
    echo "[OPCIONES] -p prefijo [ficheros], -s sufijo [ficheros]"
    echo "-p prefijo"
    echo "-s sufijo"
    exit 0
}

# si no especifico ningun parametro mostrar menu y salir
# if [ -z $# = 0];then
#     menu
#     exit 0
# fi

#primer parametro
if [ $1 = '-p' ]; then
    prefijo=$2;  
    shift; shift;

    if [ -z $prefijo  ]; then 
        echo "se espero un nombre de fichero"
        exit 0
    fi
    
    
    for fichero in $*; do
        files="mv $(pwd)/$fichero $prefijo$fichero"
        echo -e $files
        $files
        if [  ] ; then
    done
else
    menu
fi

exit 0