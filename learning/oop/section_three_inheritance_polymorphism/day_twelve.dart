// Day 12: Inheritance & Polymorphism - Method Overriding

// METHOD OVERRIDING
// A subclass can provide its own implementation
// of a method inherited from the parent class.

// @override
// The @override annotation shows that a subclass
// is replacing an inherited method.

// SUPER
// super can be used to call the parent class implementation.
// Example: super.introduce();

// POLYMORPHISM
// Different subclasses can be treated as the same base type.
// The correct overridden method runs depending on the actual object.

// DYNAMIC DISPATCH
// Dart decides at runtime which overridden method should run.

// SUBSTITUTION
// A Dog or Cat object can be stored in an Animal variable
// because both classes extend Animal.

// Example:
// Animal animal = Dog("Max");
// animal.makeSound();
//
// Even though the variable type is Animal,
// Dog's makeSound() method will run.

// WHY OVERRIDE?
// Dog and Cat are both animals,
// but they make different sounds.
// Therefore, each subclass needs its own implementation.

// Structure:
//
//            Animal
//              |
//         makeSound()
//          /       \
//       Dog         Cat
//    makeSound()  makeSound()

class Animal {
  final String name;

  Animal(this.name);

  void introduce() {
    print("My name is $name.");
  }

  void makeSound() {
    print("$name makes a sound.");
  }
}

class Dog extends Animal {
  Dog(String name) : super(name);

  @override
  void makeSound() {
    print("$name says: Woof!");
  }
}

class Cat extends Animal {
  Cat(String name) : super(name);

  @override
  void introduce() {
    super.introduce();
    print("I am a cat.");
  }

  @override
  void makeSound() {
    print("$name says: Meow!");
  }
}

void main() {
  Animal dog = Dog("Max");
  Animal cat = Cat("Luna");

  print("=== Dog ===");
  dog.introduce();
  dog.makeSound();

  print("");

  print("=== Cat ===");
  cat.introduce();
  cat.makeSound();
}
