#!/usr/bin/bash

year=$1
month=$2
quantity=$3
if [[ "$year" != "2016" && "$year" != "2017" && "$year" != "2018" && "$year" != "*" ]] 
then
       echo "argument invalide"
	exit
fi
if [[ "$month" != "01" && "$month" != "02" && "$month" != "03" && "$month" != "04" && "$month" != "05" && "$month" != "06" && "$month" != "07" && "$month" != "08" && "$month" != "09" && "$month" != "10" && "$month" != "11" && "$month" != "12" && "$month" != "*" ]]
then
       echo "argument invalide"
        exit
fi

grep "Location" ~/2024-2025/PPE1/exercice1/Exercice1/ann/$year/$month/*.ann | cut -f 3 | sort | uniq -i -c | sort -n | tail -n $quantity
