// Day 11: Inheritance & Polymorphism - Inheritance Basics

// INHERITANCE
// Inheritance allows a class to reuse fields and methods
// from another class.

// BASE CLASS / SUPERCLASS
// The parent class contains shared fields and behaviors.
// In this example, Animal is the base class.

// SUBCLASS / DERIVED CLASS
// A subclass inherits from a base class.
// Dog and Cat are subclasses of Animal.

// EXTENDS
// Dart uses the "extends" keyword for inheritance.
// Example:
// class Dog extends Animal

// SUPER
// "super" is used to access the parent class.
// super(name) sends the name value to the Animal constructor.

// REUSE
// Dog and Cat do not need to define the name field again.
// They inherit name and introduce() from Animal.

// SPECIALIZED BEHAVIOR
// Subclasses can also have their own methods.
// Dog has bark().
// Cat has meow().

// HIERARCHY
// Keep inheritance hierarchies simple.
// For this exercise, one inheritance level is enough.

// Structure:
//
//          Animal
//         /      \
//       Dog      Cat

class Animal {
  final String name;

  Animal(this.name);

  void introduce() {
    print("My name is $name.");
  }
}

class Dog extends Animal {
  Dog(String name) : super(name);

  void bark() {
    print("$name says: Woof!");
  }
}

class Cat extends Animal {
  Cat(String name) : super(name);

  void meow() {
    print("$name says: Meow!");
  }
}

void main() {
  Dog dog = Dog("Max");
  Cat cat = Cat("Luna");

  print("=== Dog ===");
  dog.introduce();
  dog.bark();

  print("");

  print("=== Cat ===");
  cat.introduce();
  cat.meow();
}
