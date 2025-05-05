# Arithmetique-des-grands-entiers
Fonction Addition et multiplication en n'utiliant que des strings et sans operations de base du language (+ , x )

Le sujet de ce projet est lie aux problematiques de l'arithmetique des grands entiers, en effet si l'on code des entiers dans une base quelconque, par exemple la base 2 dans un ordinateur, les algorithmes d'addition ou de multiplication ne sont pas exacts des que nos entiers deviennent trop grands (ou trop dissemblables en taille) et le type de representation/codage choisi sur l'ordinateur ne permet plus d'obtenir un resultat exact. L'idee est donc de proposer des algorithmes permettant d'avoir une precision parfaite sur des nombres de taille quelconque.







#### **I- Fonctions Successeur** :

#### **I-a - Digit Successeur**  
Avant de coder la fonction `successeur`, j'ai d'abord implémenté une fonction `digit_successeur` qui s'applique uniquement aux chiffres individuels (de `0` à `9`), sans gérer les retenues. Cette fonction permet de déterminer le successeur immédiat d'un chiffre dans la base donnée (par exemple, `digit_successeur("9")` retourne `"0"`).



#### **I-b - Fonctions Last et Remove Last**  
Pour implémenter la fonction `successeur`, il était nécessaire d'accéder au dernier élément d'une liste (représentant les chiffres d'un nombre) et de traiter la liste restante après suppression de cet élément. J'ai donc créé deux fonctions :  
- **`lst`** : Retourne le dernier élément d'une liste.  
- **`rem_lst`** : Retourne la liste privée de son dernier élément.  

Ces fonctions permettent de parcourir récursivement les chiffres du nombre, du dernier au premier, pour appliquer les retenues si nécessaire (par exemple, pour `"999" + 1`, on traite chaque `9` en remontant la retenue).



#### **I-c - String To List**  
La fonction `string_to_list` convertit une chaîne de caractères (représentant un nombre) en une liste de chaînes de caractères (un élément par chiffre). Pour cela, j'ai utilisé :  
- La fonction OCaml `String.to_seq` pour décomposer la chaîne en une séquence de caractères.  
- Une conversion de cette séquence en liste de `char`, puis en liste de `string` (via `String.make 1 c`).  

Exemple : `string_to_list("123")` retourne `["1"; "2"; "3"]`. Cette étape est cruciale pour manipuler les chiffres individuellement lors des opérations arithmétiques.

#### **FONCTION PRÉDÉCESSEUR** :


Pour créer la fonction prédécesseur, je suis parti d’un raisonnement simple :
Si $s(y)=x$,  alors $y=p(x)$ , où s est le successeur et p le prédécesseur.

 si je connais la fonction successeur, je peux m’en servir pour retrouver le prédécesseur d’un nombre. L’idée algorithmique est la suivante : je démarre à "0" et j’applique le successeur de manière récursive jusqu’à ce que le résultat corresponde au nombre donné. À ce moment-là, le nombre juste avant correspond au prédécesseur. Cela revient à effectuer une recherche linéaire sur la suite des successeurs, ce qui rend la fonction simple à comprendre et à coder. En plus, cette méthode me permet de réutiliser une fonction déjà testée, ce qui rend mon code plus fiable.

#### **FONCTION ADDITION** :

Pour la fonction addition, j’ai choisi une approche récursive également, mais basée sur des opérations élémentaires. L’algorithme repose sur l’idée que additionner x et y revient à incrémenter x autant de fois qu’on peut décrémenter y.

$$x+y=(x+1)+(y−1),$$ jusqu’à ce que $y=0$.

 Tant que y est différent de "0", j'incrémente x (avec successeur) et je décrémente y (avec prédécesseur). À la fin de la récursion, lorsque y = "0", la valeur de x correspond à la somme. Cette méthode met en valeur la composition de fonctions simples et la maîtrise du raisonnement récursif.


### **IV- Fonction Multiplication** :
Pour la fonction `multiplication`, j'ai d'abord essayé de trouver une forme générale de la multiplication en utilisant mes fonctions déjà codées. Je suis donc arrivé à cette expression, que j'ai simplement traduite en langage OCaml :

$$x \cdot y = \begin{cases}0 & \text{si } y = 0 \quad \text{(cas de base)}, \\x + (x \cdot P(y)) & \text{sinon}. \end{cases}$$
	
