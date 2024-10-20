#!/usr/bin/bash

total=0
for i in 2016 2017 2018
do
	total=$(expr $total + $(grep "Location" ~/2024-2025/PPE1/exercice1/Exercice1/ann/$i/*/*.ann | wc -l))
done
echo "$total"
