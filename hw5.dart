void main() {
  // Create books
  Book book1 = Book("Harry Potter", "J.K. Rowling");

  Book book2 = Book.withRating(
    "Sherlock Holmes",
    "Arthur Conan Doyle",
    9.5,
  );

  Book book3 = Book("The Hobbit", "J.R.R. Tolkien");
  book3.rating = 8.8;

  // Create library
  Library cityLib = Library("City Library");

  // Add books to library
  cityLib.addBook(book1);
  cityLib.addBook(book2);
  cityLib.addBook(book3);

  // Show books
  cityLib.showBooks();

  // Total books
  print("Total books in library: ${cityLib.totalBooks}");
}

// 1️ Book class
class Book {
  String _title;
  String _author;
  double _rating = 0;

  // Regular constructor
  Book(this._title, this._author);

  // Named constructor
  Book.withRating(this._title, this._author, double rating) {
    this.rating = rating;
  }

  // Getters
  String get title => _title;
  String get author => _author;
  double get rating => _rating;

  // Setter with validation
  set rating(double value) {
    if (value >= 0 && value <= 10) {
      _rating = value;
    } else {
      print("Rating must be between 0 and 10");
    }
  }

  // Display info
  void displayInfo() {
    print("Title: $_title");
    print("Author: $_author");
    print("Rating: $_rating");
  }
}

// ibrary class
class Library {
  String name;
  List<Book> _books = [];

  // Constructor
  Library(this.name);

  // Add book
  void addBook(Book b) {
    _books.add(b);
  }

  // Show books
  void showBooks() {
    print("Library: $name");
    print("Books list:");

    for (int i = 0; i < _books.length; i++) {
      print("${i + 1}. ${_books[i].title}");
    }
  }

  // Total books getter
  int get totalBooks {
    return _books.length;
  }
}