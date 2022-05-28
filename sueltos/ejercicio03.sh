#!/bin/bash
 
#  Cree un shell script que devuelva la hora y la fecha con formato siguiente

# rta:
echo "Son las $(date '+%H') horas, $(date '+%M') minutos del dia $(date|cut -d " " -f3) de $(date|cut -d " " -f2) de $(date| awk '{print $NF}') "

# Son las 00 horas, 11 minutos del dia 28 de may de 2022