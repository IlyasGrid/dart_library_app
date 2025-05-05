# Exercice 1 – Syntaxe de base

## Classe `Book`

```dart
class Book {
  String title;
  String author;
  int year;
  bool isAvailable;

  Book(this.title, this.author, this.year, {this.isAvailable = false});

  Book.available(this.title, this.author, this.year) : isAvailable = true;
}
```
## Classe `Library` avec ses méthodes
```dart
class Library {
  List<Book> _books = [];

  void addBook(Book book) {
    _books.add(book);
  }

  void borrowBook(String title) {
    for (var book in _books) {
      if (book.title == title && book.isAvailable) {
        book.isAvailable = false;
        break;
      }
    }
  }

  List<Book> getAvailableBooks() {
    return _books.where((book) => book.isAvailable).toList();
  }
}
```
## Fonction d’affichage

```dart
void displayBooks(List<Book> books) {
  for (var book in books) {
    print('Titre: ${book.title}, Auteur: ${book.author} (Année: ${book.year})');
  }
}
```
## Réflexions 
*Comparaison Dart vs Java et JavaScript*

| Aspect                | Dart                                | Java                             | JavaScript                           |
| --------------------- | ----------------------------------- | -------------------------------- | ------------------------------------ |
| Getters / Setters     | Très concis                         | Verbosité avec méthodes `getX()` | Concis                               |
| Surcharge d'opérateur | Intuitive                           | Plus formelle                    | Non supportée                        |
| Encapsulation         | `_` rend privé au niveau du fichier | `private` restreint à la classe  | Pas de vrai mécanisme sans closures  |
| Typage                | Statique mais concis                | Strict et verbeux                | Dynamique                            |
| Héritage              | `extends`, `super()`                | `extends`, `super()`             | Prototypes avec `extends`, `super()` |

Familier : les classes, les boucles for-in, les paramètres nommés (similaires à JavaScript).
Nouveau : la surcharge d'opérateur intuitive en Dart, et l'utilisation élégante de where() dans getAvailableBooks().

# Exercice 2 – Programmation orientée objet

*Remarques sur les attributs privés*
En Dart, les attributs commençant par _ sont privés au fichier, pas à la classe.
Cela rend leur accès limité dans les sous-classes. Il faut donc :

Soit utiliser des getters,

Soit les rendre publics ou final,

Il n'existe pas de mot-clé protected comme en Java.

## Comparatif : Dart vs Java

| Aspect                 | Dart                                 | Java                                  |
| ---------------------- | ------------------------------------ | ------------------------------------- |
| Héritage               | Oui (`extends`)                      | Oui (`extends`)                       |
| Polymorphisme          | Oui (méthodes virtuelles par défaut) | Oui (souvent avec `@Override`)        |
| Attributs privés       | `_` = privé au fichier               | `private` = dans la classe uniquement |
| Getters / Setters      | Simples avec `get`                   | Méthodes `getX()` classiques          |
| Constructeur `super()` | Oui                                  | Oui                                   |

# Exercice 3 – Programmation asynchrone

## En Java (blocant et non-blocant)
*Version synchrone (blocante)*
```java
public class Main {
    public static void main(String[] args) throws InterruptedException {
        System.out.println("Loading...");
        Thread.sleep(2000);
        System.out.println("Données reçues");
    }
}
```
*Version asynchrone avec CompletableFuture*
```java

import java.util.concurrent.*;

public class Main {
    public static void main(String[] args) {
        System.out.println("Loading...");

        CompletableFuture<String> future = CompletableFuture.supplyAsync(() -> {
            try { Thread.sleep(2000); } catch (InterruptedException e) {}
            return "Données reçues";
        });

        future.thenAccept(System.out::println);
    }
}
```
## En JavaScript
```javascript

function fetchData() {
  return new Promise(resolve => {
    setTimeout(() => resolve("Données reçues"), 2000);
  });
}

async function main() {
  console.log("Loading...");
  const data = await fetchData();
  console.log(data);
}

main();
```
## Comparatif final

| Langage        | Syntaxe                  | Nature          | Blocage      |
| -------------- | ------------------------ | --------------- | ------------ |
| **Dart**       | `Future`, `async/await`  | Natif           | Non-bloquant |
| **Java**       | `CompletableFuture`      | Verbose         | Peut bloquer |
| **JavaScript** | `Promise`, `async/await` | Léger et fluide | Non-bloquant |


✅ Conclusion : Dart et JavaScript offrent un modèle asynchrone fluide avec async/await, idéal pour les opérations d’entrée/sortie.

