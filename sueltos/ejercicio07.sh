#!/bin/bash


# login 
# echo $(whoami)

# path usario y consola
# cat /etc/passwd | grep franco| tr -s ":" " "| awk '{print $(NF-1),$NF}'
 
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







