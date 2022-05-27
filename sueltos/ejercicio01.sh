#! /bin/bash
#
# Haga un shell script que devuelva los argumentos primero y ultimo que se han pasado
# 
# Si se llama con: 
# archivo.sh hola como estas
# 
# debe responder:
# El primer argumento es hola
# El ultimo argumento es estas
#
 
if [ $# = 0 ]; then
    echo "No ingreso ningun argumento"
    exit 0
fi

for last in $* ; do true
done

for arg in $* ; do
    if [ $arg = $1 ]; then
        echo "El primer argumento es $arg"
    fi
done

echo  "El ultimo argumento es $last"
 