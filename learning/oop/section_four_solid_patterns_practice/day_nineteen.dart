// Day 19: SOLID, Patterns & Practice - Observer and Refactoring Legacy OOP

// --------------------------------------------------
// OBSERVER PATTERN
// --------------------------------------------------

// Observer Pattern creates a subscription system
// between objects.

// One object publishes an event.
// Other objects subscribe and react to that event.

// SUBJECT / PUBLISHER
// The publisher stores observers and notifies them
// when something important happens.

// OBSERVER / SUBSCRIBER
// An observer waits for notifications
// and reacts when update() is called.

// Example:
//
// Order
//   |
//   | notify
//   |
//   +----> EmailObserver
//   |
//   +----> LoggerObserver

// When the order status changes,
// all subscribed observers are notified.

// --------------------------------------------------
// SUBSCRIBE
// --------------------------------------------------

// addObserver() registers a new observer.

// After subscribing, the observer will receive
// future notifications.

// --------------------------------------------------
// NOTIFY
// --------------------------------------------------

// notifyObservers() sends an event
// to every registered observer.

// The publisher does not need to know
// exactly what each observer does.

// --------------------------------------------------
// LEGACY CODE
// --------------------------------------------------

// Legacy code is existing code that may be
// difficult to understand, test, or modify safely.

// A common problem is a God Class.

// --------------------------------------------------
// GOD CLASS
// --------------------------------------------------

// A God Class knows or does too much.

// BAD DESIGN:
//
// Order handles:
// - order state
// - email notifications
// - logging
// - printing
// - saving data

// This creates too many responsibilities
// inside one class.

// BETTER DESIGN:
//
// Order handles order state.
// EmailObserver handles email notifications.
// LoggerObserver handles logging.

// --------------------------------------------------
// CHARACTERIZATION
// --------------------------------------------------

// Before refactoring existing code,
// understand and document its current behavior.

// Do not change behavior accidentally.

// First ask:
// What does the current code do?

// Then refactor the internal design.

// --------------------------------------------------
// INCREMENTAL REFACTORING
// --------------------------------------------------

// Refactor in small steps.

// 1. Understand current behavior.
// 2. Extract one responsibility.
// 3. Verify that behavior still works.
// 4. Extract another responsibility.
// 5. Verify again.

// Small changes are easier to understand
// and safer than one huge rewrite.

// --------------------------------------------------
// RULE OF THUMB
// --------------------------------------------------

// Observer:
// One event can notify multiple interested objects.

// Refactoring:
// Improve code structure without changing behavior.

// Keep responsibilities separated.
// Refactor in small and verifiable steps.

abstract class OrderObserver {
  void update(String status);
}

class EmailObserver implements OrderObserver {
  @override
  void update(String status) {
    print("Email notification: Order status changed to $status.");
  }
}

class LoggerObserver implements OrderObserver {
  @override
  void update(String status) {
    print("Log: Order status changed to $status.");
  }
}

class Order {
  String _status = "Pending";

  final List<OrderObserver> _observers = [];

  String get status => _status;

  void addObserver(OrderObserver observer) {
    _observers.add(observer);
  }

  void removeObserver(OrderObserver observer) {
    _observers.remove(observer);
  }

  void changeStatus(String newStatus) {
    if (newStatus.trim().isEmpty) {
      throw ArgumentError("Status cannot be empty.");
    }

    _status = newStatus;

    notifyObservers();
  }

  void notifyObservers() {
    for (OrderObserver observer in _observers) {
      observer.update(_status);
    }
  }
}

void main() {
  Order order = Order();

  OrderObserver emailObserver = EmailObserver();
  OrderObserver loggerObserver = LoggerObserver();

  order.addObserver(emailObserver);
  order.addObserver(loggerObserver);

  print("=== First Status Change ===");

  order.changeStatus("Shipped");

  print("");

  print("=== Second Status Change ===");

  order.changeStatus("Delivered");
}
