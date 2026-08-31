Day 4: OOP Fundamentals - Behavior and Responsibilities

-------------------------------------------------------

Single Responsibility

**

class User:
    def __init__(self, name, email):
        self.name = name
        self.email = email

    def save_user(self):
        print("Saving user...")

    def send_email(self):
        print("Sending email...")

**

class User:
    def __init__(self, name, email):
        self.name = name
        self.email = email

class EmailService:
    def send_email(self, user):
        print("Sending email to:", user.email)

-------------------------------------------------------

Tell, Don't Ask

if account.balance >= 100:
    account.balance -= 100

class BankAccount:
    def __init__(self, balance):
        self.balance = balance

    def withdraw(self, amount):
        if self.balance >= amount:
            self.balance -= amount

class BankAccount:
    def __init__(self, balance):
        self.balance = balance

    def withdraw(self, amount):
        if self.balance >= amount:
            self.balance -= amount

-------------------------------------------------------

Side Effects — Command ve Query

Command

def deposit(selfi, amount):
    self.balance += amount

Query

def get_balance(self):
    retutn self.balance

class BankAccount:
    def __init__(self, balance):
        self.balance = balance

    def deposit(self, amount):
        self.balance += amount

    def get_balance(self):
        return self.balance

account = BankAccount(500)

account.deposit(100)

print(account.get_balance())

-------------------------------------------------------

Collaboration

class Customer:
    def __init__(self, name):
        self.name = name

class Order:
    def __init__(self, customer, product):
        self.customer = customer
        self.product = product

    def show_order(self):
        print("Customer:", self.customer.name)
        print("Product:", self.product)


customer = Customer("Zeynep")

order = Order(customer, "Keyboard")

order.show_order()