#!/usr/bin/env bash
if [ $# -ne 1 ]
then
	echo "Le script prend un argument exactement"
	exit 1
fi

echo '<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.2/css/bulma.min.css">
    </head>
    <body>' >> "tableau-fr.html"
echo -e '       <table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
            <tr class="is-link">
                <th>Number</th>
                <th>URL</th>
                <th>Code</th>
                <th>Encoding</th>
                <th>Word Number</th>
            </tr>' >> "tableau-fr.html"

file_path=$1
line_number=1
while read -r line
do
    http_code=$(curl -s -I -L -w "%{http_code}" -o /dev/null $line)
    encoding=$(curl -s -I -L -w "%{content_type}" -o /dev/null $line | grep -P -o "charset=\S+" | cut -d"=" -f2)
    encoding=${encoding:-"N/A"}
    nbmot=$(lynx -dump -nolist $line | wc -w)

	echo -e "           <tr>
                <td>$line_number</td>
                <td><a href="$line">$line</a></td>
                <td>$http_code</td>
                <td>$encoding</td>
                <td>$nbmot</td>" >> "tableau-fr.html"
	line_number=$(expr $line_number + 1)
done < $file_path
echo '      </table>' >> "tableau-fr.html"
echo '  </body>  
</html>' >> "tableau-fr.html"
