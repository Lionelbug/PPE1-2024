#!/usr/bin/env bash
if [ $# -ne 1 ]
then
	echo "Le script prend un argument exactement"
	exit 1
fi

file_path="$1"
line_number=1
while read -r line
do
	# le code HTTP de réponse à la requête
	http_code=$(curl -I -s "$line" | head -n 1 | grep -E -o "[0-9]{3}")

	if [ $http_code -eq 200 ]
	then
		temp_file=$(mktemp)
		curl -s "$line" -o "$temp_file"
        encoding=$(grep -i "charset" "$temp_file")
        if [[ -z "$encoding" ]]
        then
            encoding="N/A"
        fi
        word_count=$(wc -w < "$temp_file")
        rm "$temp_file"
    elif [ $http_code -eq 301 ]
    then
		new_line=$(curl -I -s "$line" | grep "location" | cut -d " " -f 2 | tr -d '\r')
		temp_file=$(mktemp)
		curl -s "$new_line" -o "$temp_file"
        encoding=$(grep -i "charset" "$temp_file")
        if [[ -z "$encoding" ]]
        then
            encoding="N/A"
        fi
        word_count=$(wc -w < "$temp_file")
        rm "$temp_file"
    else
        encoding="Error"
        word_count="Error"
    fi

	echo -e "$line_number\t$line\t$http_code\t$encoding\t$word_count"
	((line_number++))
done < "$file_path"
