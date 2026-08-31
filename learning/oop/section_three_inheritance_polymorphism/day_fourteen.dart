// Day 14: Inheritance & Polymorphism - Composition over Inheritance

// INHERITANCE
// Inheritance represents an "is-a" relationship.
//
// Example:
// Dog is an Animal.
// Therefore, Dog can extend Animal.

// COMPOSITION
// Composition represents a "has-a" relationship.
//
// Example:
// Car has an Engine.
// Car is NOT an Engine.
// Therefore, Car should contain an Engine object
// instead of extending Engine.

// SPOT MISUSE
// Inheritance should not be used only to reuse code.
// If there is no true "is-a" relationship,
// composition is usually a better choice.

// COMPOSE INSTEAD
// An object can contain another object as a field.
//
// Example:
// class Car {
//   final Engine engine;
// }

// DELEGATION
// Delegation means asking another object to perform a task.
//
// Car does not need to know how an engine works.
// It simply calls:
// engine.start();

// BEHAVIOR SHARING
// Different implementations can share behavior
// through a common abstraction.

// For example:
// ElectricEngine and GasEngine can both
// implement the Engine contract.

// POLYMORPHISM
// Car depends on Engine instead of a specific engine type.
// This allows different engines to be used.

// RULE OF THUMB
// Prefer inheritance for true "is-a" relationships.
// Prefer composition when an object "has-a" or "uses-a"
// different object.

// Structure:
//
//              Engine
//             /      \
//     GasEngine    ElectricEngine
//          \          /
//           \        /
//               Car
//
// Car HAS an Engine.
// Car IS NOT an Engine.

abstract class Engine {
  void start();
}

class GasEngine implements Engine {
  @override
  void start() {
    print("Gas engine started.");
  }
}

class ElectricEngine implements Engine {
  @override
  void start() {
    print("Electric engine started.");
  }
}

class Car {
  final Engine engine;

  Car(this.engine);

  void startCar() {
    print("Starting car...");
    engine.start();
    print("Car is ready.");
  }
}

void main() {
  Engine gasEngine = GasEngine();
  Car gasCar = Car(gasEngine);

  print("=== Gas Car ===");
  gasCar.startCar();

  print("");

  Engine electricEngine = ElectricEngine();
  Car electricCar = Car(electricEngine);

  print("=== Electric Car ===");
  electricCar.startCar();
}
