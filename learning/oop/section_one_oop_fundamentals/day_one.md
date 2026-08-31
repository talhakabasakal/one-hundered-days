Day 1: OOP Fundamentals - What Is Object-Oriented Programming

-------------------------------

Procedural;

name = "Zeynep"
grade = 85

def show_info(name, grade):
    print("Name:" name)
    print("Grade:" grade)

show_info(name, grade)

-------------------------------

OOP;

class Student:
    def __init__(self, name, grade):
        self.name = name
        self.grade = grade

    def show_info(self):
        print("Name:", self.name)
        print("Grade:", self.grade)

student = StudentU("Zeynep", 85)
student.show_info()

-------------------------------