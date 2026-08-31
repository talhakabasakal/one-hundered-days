Day 5: OOP Fundamentals - Practice

------------------------------------------------------

Mini Domain

class Book:
    def __init__(self, title, author):
        if not title:
            raise ValueError("Title cannot be empty.")
        
        if not author:
            raise ValueError("Author cannot be empty.")

        self.title = title
        self.author = author
        self.is_borrowed = False

    def borrow(self):
        if self.is_borrowed:
            print("This book is already borrowed.")
            return

        self.is_borrowed = True

    def return_book(self):
        self.is_borrowed= False    

if not title:
    raise ValueError("Title cannot be empty.")

self.is_borrowed = False

borrow()
return_book()

------------------------------------------------------

Member Class

class Member:
    def __init__(self, name):
        if not name:
            raise ValueError("Name cannot be empty.")

        self.name = name
        self.borrowed_books = []

    def add_book(self, book):
        self.borrowed_books.append(book)

    def remove_book(self, book):
        self.borrowed_books.remove(book)

------------------------------------------------------

Library Class

class Library:
    def lend_book(self, book, member):
        if book.is_borrowed:
            print("Book is not available.")
            return

        book.borrow()
        member.add_book(book)

        print("Book borrowed successfully.")

    def receive_book(self, book, member):
        book.return_book()
        member.remove_book(book)

        print("Book returned successfully.")

------------------------------------------------------

Create Scenarios

book1 = Book("1984", "George Orwell")
book2 = Book("The Hobbit", "J. R. R. Tolkien")

member = Member("Alex")

library = Library()

library.lend_book(book1, member)

library.lend_book(book2, member)

library.receive_book(book1, member)

for book in member.borrowed_books:
    print(book.title)

------------------------------------------------------

Full Code

class Book:
    def __init__(self, title, author):
        if not title:
            raise ValueError("Title cannot be empty.")

        if not author:
            raise ValueError("Author cannot be empty.")

        self.title = title
        self.author = author
        self.is_borrowed = False

    def borrow(self):
        if self.is_borrowed:
            print("This book is already borrowed.")
            return

        self.is_borrowed = True

    def return_book(self):
        self.is_borrowed = False


class Member:
    def __init__(self, name):
        if not name:
            raise ValueError("Name cannot be empty.")

        self.name = name
        self.borrowed_books = []

    def add_book(self, book):
        self.borrowed_books.append(book)

    def remove_book(self, book):
        self.borrowed_books.remove(book)


class Library:
    def lend_book(self, book, member):
        if book.is_borrowed:
            print("Book is not available.")
            return

        book.borrow()
        member.add_book(book)

        print("Book borrowed successfully.")

    def receive_book(self, book, member):
        book.return_book()
        member.remove_book(book)

        print("Book returned successfully.")


book1 = Book("1984", "George Orwell")
book2 = Book("The Hobbit", "J. R. R. Tolkien")

member = Member("Alex")
library = Library()

library.lend_book(book1, member)
library.lend_book(book2, member)

library.receive_book(book1, member)

for book in member.borrowed_books:
    print(book.title)

------------------------------------------------------