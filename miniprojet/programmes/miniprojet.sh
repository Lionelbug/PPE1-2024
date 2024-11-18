#!/usr/bin/env bash
if [ $# -ne 1 ]
then
	echo "Le script prend un argument exactement"
	exit 1
fi

file_path=$1
line_number=1
while read -r line
do
    http_code=$(curl -s -I -L -w "%{http_code}" -o /dev/null $line)
    encoding=$(curl -s -I -L -w "%{content_type}" -o /dev/null $line | grep -P -o "charset=\S+" | cut -d"=" -f2)
    encoding=${encoding:-"N/A"}
    nbmot=$(lynx -dump -nolist $line | wc -w)

	echo -e "$line_number\t$line\t$http_code\t$encoding\t$nbmot" >> "tableau-fr.tsv"
	line_number=$(expr $line_number + 1)
done < "$file_path"
