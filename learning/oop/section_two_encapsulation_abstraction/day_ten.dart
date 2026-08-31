//Day 10: Encapsulation & Abstraction - Practice

// HARDEN YOUR MODEL
// Fields should not be freely changed from outside the class.
// Private fields use "_" in Dart.
// Objects should control their own state through methods.

// INVARIANTS
// 1. A book title cannot be empty.
// 2. An author name cannot be empty.
// 3. A member name cannot be empty.
// 4. A borrowed book cannot be borrowed again.
// 5. A book cannot be returned if it was not borrowed.

// ABSTRACTION
// Methods should describe what we want to do,
// instead of exposing the internal steps.

// borrow() means: borrow this book.
// returnBook() means: return this book.
// lendBook() means: lend a book to a member.
// receiveBook() means: receive a returned book.

// FAIL FAST
// Invalid operations should immediately throw an error.
// This prevents objects from entering an invalid state.

// BEFORE / AFTER
// Before encapsulation, fields could be changed directly.
// Now a book's borrowed state cannot be changed freely.
// An already borrowed book cannot be borrowed again.
// An available book cannot be returned.
// Invalid empty names and titles cannot create valid objects.

class Book {
  final String _title;
  final String _author;
  bool _isBorrowed = false;

  Book(String title, String author) : _title = title, _author = author {
    if (title.trim().isEmpty) {
      throw ArgumentError("Title cannot be empty.");
    }

    if (author.trim().isEmpty) {
      throw ArgumentError("Author cannot be empty.");
    }
  }

  String get title => _title;

  String get author => _author;

  bool get isBorrowed => _isBorrowed;

  void borrow() {
    if (_isBorrowed) {
      throw StateError("This book is already borrowed.");
    }

    _isBorrowed = true;
  }

  void returnBook() {
    if (!_isBorrowed) {
      throw StateError("This book is not currently borrowed.");
    }

    _isBorrowed = false;
  }
}

class Member {
  final String _name;
  final List<Book> _borrowedBooks = [];

  Member(String name) : _name = name {
    if (name.trim().isEmpty) {
      throw ArgumentError("Member name cannot be empty.");
    }
  }

  String get name => _name;

  List<Book> get borrowedBooks => List.unmodifiable(_borrowedBooks);

  void borrowBook(Book book) {
    book.borrow();
    _borrowedBooks.add(book);
  }

  void returnBook(Book book) {
    if (!_borrowedBooks.contains(book)) {
      throw StateError("This member did not borrow this book.");
    }

    book.returnBook();
    _borrowedBooks.remove(book);
  }
}

class Library {
  void lendBook(Book book, Member member) {
    member.borrowBook(book);

    print("${book.title} was borrowed by ${member.name}.");
  }

  void receiveBook(Book book, Member member) {
    member.returnBook(book);

    print("${book.title} was returned by ${member.name}.");
  }
}

void main() {
  Book book1 = Book("1984", "George Orwell");
  Book book2 = Book("The Hobbit", "J. R. R. Tolkien");

  Member member = Member("Alex");

  Library library = Library();

  library.lendBook(book1, member);
  library.lendBook(book2, member);

  print("");
  print("Borrowed books:");

  for (Book book in member.borrowedBooks) {
    print(book.title);
  }

  print("");

  library.receiveBook(book1, member);

  print("");
  print("Books after return:");

  for (Book book in member.borrowedBooks) {
    print(book.title);
  }
}
