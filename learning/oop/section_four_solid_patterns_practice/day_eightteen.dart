// Day 18: SOLID, Patterns & Practice - Factory & Strategy

// --------------------------------------------------
// DESIGN PATTERN
// --------------------------------------------------

// A design pattern is a reusable solution
// to a common software design problem.

// Patterns are tools, not mandatory rules.
// We should use them only when they make
// the design simpler and clearer.

// --------------------------------------------------
// FACTORY PATTERN
// --------------------------------------------------

// Factory Pattern centralizes object creation.

// Instead of creating concrete objects
// throughout the application:
//
// DeliveryService(StandardDelivery());
// DeliveryService(ExpressDelivery());
//
// we can move creation logic into a factory.

// Example:
// DeliveryFactory.create("standard");

// The caller does not need to know
// exactly how the object is created.

// BENEFITS:
// Object creation is centralized.
// Creation logic is easier to maintain.
// Callers depend less on concrete classes.

// --------------------------------------------------
// STRATEGY PATTERN
// --------------------------------------------------

// Strategy Pattern defines multiple interchangeable
// algorithms behind a common contract.

// Example:
// StandardDelivery
// ExpressDelivery
// SameDayDelivery

// All strategies implement the same contract:
//
// calculateCost()

// The application can switch strategies
// without changing DeliveryService.

// --------------------------------------------------
// REPLACE CONDITIONALS
// --------------------------------------------------

// BAD DESIGN:
//
// if (type == "standard") {
//   ...
// } else if (type == "express") {
//   ...
// } else if (type == "sameDay") {
//   ...
// }

// Large conditionals become difficult to maintain.

// STRATEGY DESIGN:
//
// DeliveryStrategy strategy;
//
// strategy.calculateCost(weight);

// Each algorithm lives in its own class.

// --------------------------------------------------
// FACTORY + STRATEGY
// --------------------------------------------------

// Factory decides WHICH strategy object to create.
//
// Strategy decides HOW the operation is performed.

// Factory:
// "Which object should I create?"

// Strategy:
// "Which algorithm should I use?"

// --------------------------------------------------
// DON'T FORCE PATTERNS
// --------------------------------------------------

// Patterns should solve real design problems.

// If the application only needs one simple behavior,
// a normal class may be better.

// Adding unnecessary patterns can make
// simple code harder to understand.

// --------------------------------------------------
// RULE OF THUMB
// --------------------------------------------------

// Factory:
// Centralize object creation.

// Strategy:
// Encapsulate interchangeable algorithms.

// Use patterns when they reduce complexity.
// Avoid patterns when they only add extra structure.

abstract class DeliveryStrategy {
  double calculateCost(double weight);
}

class StandardDelivery implements DeliveryStrategy {
  @override
  double calculateCost(double weight) {
    return weight * 5;
  }
}

class ExpressDelivery implements DeliveryStrategy {
  @override
  double calculateCost(double weight) {
    return weight * 10;
  }
}

class SameDayDelivery implements DeliveryStrategy {
  @override
  double calculateCost(double weight) {
    return weight * 15;
  }
}

class DeliveryFactory {
  static DeliveryStrategy create(String type) {
    switch (type.toLowerCase()) {
      case "standard":
        return StandardDelivery();

      case "express":
        return ExpressDelivery();

      case "sameday":
        return SameDayDelivery();

      default:
        throw ArgumentError("Unknown delivery type.");
    }
  }
}

class DeliveryService {
  final DeliveryStrategy strategy;

  DeliveryService(this.strategy);

  void calculateDelivery(double weight) {
    if (weight <= 0) {
      throw ArgumentError("Weight must be greater than zero.");
    }

    double cost = strategy.calculateCost(weight);

    print("Package weight: ${weight.toStringAsFixed(2)} kg");
    print("Delivery cost: \$${cost.toStringAsFixed(2)}");
  }
}

void main() {
  DeliveryStrategy standard = DeliveryFactory.create("standard");

  DeliveryStrategy express = DeliveryFactory.create("express");

  DeliveryStrategy sameDay = DeliveryFactory.create("sameday");

  print("=== Standard Delivery ===");

  DeliveryService standardService = DeliveryService(standard);

  standardService.calculateDelivery(2);

  print("");

  print("=== Express Delivery ===");

  DeliveryService expressService = DeliveryService(express);

  expressService.calculateDelivery(2);

  print("");

  print("=== Same Day Delivery ===");

  DeliveryService sameDayService = DeliveryService(sameDay);

  sameDayService.calculateDelivery(2);
}
