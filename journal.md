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

# Séance 3
## exercices git
cette ligne doit rester après correction

## exercices 4
Compter les nombres des lien valides et les liens invalides.

# S2

## Rappels sur Git

- `git clone <URL>`
- `git add`, `git commit [-m message]` et `git push`
- `git tag <name> [commit]`
- `git fetch`, `git status` et `git pull`
- `git checkout <destination>` : destination peut être un chemin absolu (un nom ou une étiquette de commit) ou relatif.
On peut pour cela utiliser les opérateurs `^` et `~[N]`, qui permettent de se déplacer respectivement d'un parent ou d'un nombre N de parents à partir du commit courant.
Par exemple : `git checkout HEAD^^` et `git checkout HEAD~2` signifient remonter de deux parents.
- `git reset <destination>` : revenir à la version du dépôt ciblée, et annuler tous les commits intermédiaires. Ces commits intermédiaires ne font plus partie de l'historique des commits.
- `git revert <destination>` : produire un nouveau commit à la suite des commits visés, mais les annulant.

## Branches

- `git branch <name>` : Crée une branche.
- `git checkout <name>` : Bascule sur la branche.
- `git checkout -b <name>` : Crée et bascule sur une branche.

## Merge

- `git merge <name>` :
  - Fusionne le contenu du commit sur lequel vous êtes avec le contenu du commit dont vous donnez le nom name.
  - Crée un commit qui prend les contenus distincts de ces deux commits.
  - L'historique des commits est conservé en l'état.
- `git merge <name>` : Intégrer les commits d'une branche dans une autre sans pour autant créer un commit.

## séance 1 29/01/2025 Branche

### Gérer les branches : `git branche [-options...]`

- `--list ou rien` : lister les branches
- `git branch <nom-branche> [reference]` : créer la branche
- `git branch -m/-c [ancien] <nouveau>` : renommer/copier une branche
- `git branch -d <nom>` : supprimer une branche

### Changer de branche : `git checkout` et `git switch`

- `git checkout [-b] <branche>` : Bascule sur la branche. L'option -b permet de la créer au passage.
  Si on veut basculer sur la branche MyBranch qui existe sur le dépôt distant, on tape `git checkout origin/MyBranch`.
  Attention, dans ce cas-là, on est dans l'état **Detached HEAD**. HEAD ne pointe plus vers une branche, mais directement vers un commit spécifique. C'est-à-dire que on peut voir ou modifier le code, et faire un commit. Mais ce commit ne sera rattaché à aucune branche. Si on change de branche, il risque d'être perdu.
- `git switch [-c] <branche>` : Bascule sur la branche. L'option -c permet de la créer au passage.
  Si on veut basculer sur la branche MyBranch qui existe sur le dépôt distant, on tape `git switch origin/MyBranch`.
  Dans ce cas-là, `git switch` peut automatiquement la créer et la configurer pour suivre la branche distante.

### Raccorder une branche au dépôt distant : `git push`

- `git push --set-upstream origin <branche>`

### Récupérer des changements d'ailleurs v1 : `git merge [-options...] <commit>`

- `git merge <commit>` : récupère l'historique de commit.
