#!/usr/bin/bash
entity=$1
for i in 2016 2017 2018
do
	./compte_par_type.sh $i $entity
done
