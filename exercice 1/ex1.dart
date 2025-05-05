// Partie 1 : Structures de Données

class Book {
  String title;
  String author;
  int year;
  bool isAvailable;

  Book(this.title, this.author, this.year, {this.isAvailable = false});

  // Constructeur nommé pour un livre disponible
  Book.available(this.title, this.author, this.year) : isAvailable = true;
}

class Library {
  final List<Book> _books = [];

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

// Partie 2 : Fonctions et Opérateurs

  // Surcharge de l'opérateur +
  Library operator +(Library other) {
    final merged = Library();
    merged._books.addAll(_books);
    merged._books.addAll(other._books);
    return merged;
  }
}

void displayBooks(List<Book> books) {
  for (var book in books) {
    print('Titre: ${book.title}, Auteur: ${book.author} (Année: ${book.year})');
  }
}

// Partie 3 : Contrôle de Flux
void main() {
  // Création de livres
  var book1 = Book.available('1984', 'George Orwell', 1949);
  var book2 = Book.available('Brave New World', 'Aldous Huxley', 1932);
  var book3 = Book('Fahrenheit 451', 'Ray Bradbury', 1953); // non disponible

  // Création de la première bibliothèque
  var library1 = Library();
  library1.addBook(book1);
  library1.addBook(book2);
  library1.addBook(book3);

  // Emprunt d’un livre
  library1.borrowBook('1984');

  // Affichage des livres disponibles
  print('Livres disponibles dans library1 :');
  displayBooks(library1.getAvailableBooks());

  // Création d'une deuxième bibliothèque
  var library2 = Library();
  library2.addBook(Book.available('Le Meilleur des Mondes', 'Aldous Huxley', 1932));

  // Fusion des deux bibliothèques
  var mergedLibrary = library1 + library2;

  print('\nLivres disponibles après fusion :');
  displayBooks(mergedLibrary.getAvailableBooks());
}
