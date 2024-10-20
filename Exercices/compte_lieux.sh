#!/usr/bin/bash

year=$1
month=$2
quantity=$3
grep "Location" ~/2024-2025/PPE1/exercice1/Exercice1/ann/$year/$month/*.ann | cut -f 3 | sort | uniq -i -c | sort -n | tail -n $quantity
