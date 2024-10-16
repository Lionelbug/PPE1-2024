# Journal de bord du projet encadré

- `git clone <le lien de SSH>` : télécharger le dépôt en ligne dans ton dépôt local
- `git fetch` : récupérer le status du dépôt en ligne
- `git status` : voir le status du dépôt local
- `git pull` :  télécharger tous les modification du dépôt en ligne dans ton dépôt local

## faire un commit

- `git add file`
- `git commit -m "message"`
- `git push`

## créer un tag

- `git tag < nom_tag >`
- `git push origin < nom_tag >`

## pipelines

### cat

- `cat fichier` Afficher le contenu d'un fichier
- `cat fichier1 fichier2` Concaténer plusieurs fichiers
- `cat nouveau_fichier` Créer un nouveau fichier
- `cat fichier > nouveau_fichier` Rediriger la sortie vers un autre fichier

  *Tapez du texte dans le terminal, puis faites Ctrl + D pour sauvegarder.*

### wc

- `wc fichier` Compter le nombre de lignes, de mots et de caractères dans un fichier

  *Cela affichera quelque chose comme : 10 50 200 nom_du_fichier.txt*
- `wc fichier1 fichier2` Compter plusieurs fichiers

  *Cela affichera quelque chose comme :*  
  *10  50 200 fichier1txt*  
  *5  25 100 fichier2.txt*  
  *15  75 300 total*

#### wc option

- `-l` Compter uniquement les lignes
- `-w` Compter uniquement les mots
- `-c` Compter uniquement les caractères

### grep

- `grep "mot" fichier` Rechercher une chaîne spécifique dans un fichier

#### grep option

- `-i` Ignorer la casse
- `-r` Rechercher de manière récursive dans des dossiers
- `-c` Afficher uniquement le nombre de lignes qui correspondent
- `-w` Rechercher des mots complets

### echo

- `echo "text"` Afficher une chaîne de texte simple
- `echo "text" > fichier` Rediriger la sortie vers un fichier
- `echo "text" >> fichier` Rediriger la sortie vers un fichier (ajoute à la fin du fichier)


