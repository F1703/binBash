#! /bin/bash
#
#

echo "Colores Foreground Code"
for color in $(seq 30 37) ; do
    echo "\e[0;"$color"m ColorCode: $color  \e[0m"
done

echo "\nColores Background Code"
for color in $(seq 40 47) ; do
    echo "\e[0;"$color"m ColorCode: $color  \e[0m"
done

echo "\nNormal Characters"
for color in $(seq 30 37) ; do
    echo "\e[0;"$color"m ColorCode: $color  \e[0m"
done


echo "\nBold Characters"
for color in $(seq 30 37) ; do
    echo "\e[1;"$color"m ColorCode: $color  \e[0m"
done

echo "\nUnderlined Characters"
for color in $(seq 30 37) ; do
    echo "\e[4;"$color"m ColorCode: $color  \e[0m"
done

echo "\nBlinking Characters"
for color in $(seq 30 37) ; do
    echo "\e[5;"$color"m ColorCode: $color  \e[0m"
done

echo "\nReverse vide Characters"
for color in $(seq 30 37) ; do
    echo "\e[7;"$color"m ColorCode: $color  \e[0m"
done