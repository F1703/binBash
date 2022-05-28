#!/bin/bash

# Cree un shell que reciba un unico parametro ( el login de un usuario) y que muestre la siguiente informacion 
#     login
#     nombre completo del usuario
#     directorio home
#     shell que utiliza
#     una linea que indique si el usuario esta actualmente conectado o no.
#     procesos pertenecientes a dicho usuario. La informacion a mostrar para proceso debe ser el PID y la linea de ordenes que dio lugar a la creacion de dicho proceso

# Se debe comprobar:
#     si las opciones y parametros son correctas
#     si el usuario que se pasa como parametro existe o no

# Ademas, debe permitir las siguientes opciones
#     -p: solo muestra informacion de procesos.
#     -u: muestra toda la informacion excepto la referente a los procesos.
#     -h: muestra toda la informacion de ayuda (lo que hace el guion, su sistaxis, y significado de opciones y parametros)


 
function menu {
    echo "Uso: [opciones] usuario"
    echo " Opciones: "
    echo -e "\t-p mostrar procesos de usuario"
    echo -e "\t-u mostrar info del usuario"
    echo -e "\t-h mostrar ayuda"
    echo -e "\t--help mostrar ayuda"
    echo " usuario: nombre del usuario"
    exit 0
}
 
if [ $# -eq 0 ]; then
    echo " No se ingreso ningun parametro"
    echo 
    menu
    exit 1
fi

# mostrar menu
if [ $1 = '-h' ] || [ $1 = '--help' ]; then
    menu
fi

if [ $1 = '-u' ]; then
    if [ $# -eq 1 ]; then
        echo "No ingreso nombre de  usuario"
        menu
        exit 1
    fi
    shift
    # verificar que el usuario existe
    exist=$(cat /etc/passwd  | grep $1 | wc -l )
    if [ $exist = "1" ] ; then
        echo "El usuario existe"
    else
        echo "El usuario no existe"
    fi

    # datos completos del usuario
    echo "Nombre: $(cat /etc/passwd | grep $1 | awk -F: '{print $5}') "

    # shel que utiliza
    echo "Shell: $(cat /etc/passwd | grep $1| tr -s ":" " "| awk '{print $NF}') "

    # usuario conectado
    conn=$(w | grep $1 | wc -l )
    if [ $conn = 1 ]; then
        echo "Conectado: Si"
    else
        echo "Conectado: No"
    fi

    exit 0
fi

# listar procesos de usuario 
if [ $1 = '-p' ]; then
    if [ $# -eq 1 ]; then
        echo "No ingreso nombre de  usuario"
        menu
        exit 1
    fi
    shift
    echo "PROCEOS DEL USUARIO: $1" 
    echo -e "USUARIO\tPID\tCOMMAND"
    echo "$(ps aux | awk '{print $1"\t"$2 "\t" $11}' | grep $1)"
    exit 0
fi

echo "Parametros incorrectos"
menu







