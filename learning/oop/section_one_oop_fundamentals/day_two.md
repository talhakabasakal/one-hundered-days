Day 2: OOP Fundamentals - Classes and Objects

---------------------------------------------

Define a Class

class Book:
    def __init__(self, title, author, pages):
        self.title = title
        self.author = author
        self.pages = pages

book = Book("The Little Prince,"Antoine de Saint-Exupery", 96)

---------------------------------------------

Create Instances

book1 = Book("The Little Prince", "Antoine de Saint-Exupery", 96)

---------------------------------------------

Call Methods

class Book:
    def __init__(self, title, author, pages):
        self.title = title
        self.author = author
        self.pages = pages

    def show_info(self):
        print("Title:", self.title)
        print("Author:", self.author)
        print("Pages:", self.pages)

book1 = Book("The Little Prince", "Antoine de Saint-Exupery", 96)
book2 = Book("1984", "George Orwell", 328)

book1.show_info()
book2.show_info()

---------------------------------------------

Inspect State

print(book1.title)
print(book2.title)
