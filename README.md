# Arithm-tique-des-grands-entiers
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


### **IV- Fonction Multiplication** :
Pour la fonction `multiplication`, j'ai d'abord essayé de trouver une forme générale de la multiplication en utilisant mes fonctions déjà codées. Je suis donc arrivé à cette expression, que j'ai simplement traduite en langage OCaml :

$$x \cdot y = \begin{cases}0 & \text{si } y = 0 \quad \text{(cas de base)}, \\x + (x \cdot P(y)) & \text{sinon}. \end{cases}$$
	
