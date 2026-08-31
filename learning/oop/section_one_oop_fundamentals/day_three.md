
Day 3: OOP Fundamentals - Constructors and Initialization

---------------------------------------------------------

Write a Constructor

class Product:
    def __init__(self, name, price):
        self.name = name
        self.price = price

product = Product("Keyboard", 50)

print(product.name)
print(product.price)

---------------------------------------------------------

Validate Inputs

class Product:
    def __init__(self, name, price):
        if not name:
            raise ValueError("Name cannot be empty.")

        if price < 0:
            raise ValueError("Price cannot be negative.")
        
        self.name = name
        self.price = price

//product = Product("", 50)

//product = Product("Keyboard", -50)

---------------------------------------------------------

Default Values

class Product:
    def __init__(self, name, price, stock=0);
        self.name = name 
        self.price = price
        self.stock = stock

product1 = Product("Keyboard", 50, 10)
product2 = Product("Mouse", 25)

print(product2.stock)

---------------------------------------------------------

Factory Method

class Product:
    def __init__(self, name, price, stock=0):
        if not name:
            raise ValueError("Name cannot be empty.")

        if price < 0:
            raise ValueError("Price cannot be negative.")

        self.name = name
        self.price = price
        self.stock = stock

    @classmethod
    def free_product(cls, name):
        return cls(name, 0)

product = Product.free_product("Sample")

print(product.name)
print(product.price)
