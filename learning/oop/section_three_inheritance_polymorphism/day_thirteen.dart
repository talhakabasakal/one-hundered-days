// Day 13: Inheritance & Polymorphism - Interfaces and Abstract Contracts

// CONTRACT
// A contract defines what an object must be able to do.
// It does not need to define exactly how the operation works.

// ABSTRACT CLASS
// An abstract class can define methods that subclasses
// or implementations are required to provide.

// INTERFACE
// In Dart, a class can be used as an interface.
// The "implements" keyword means a class agrees
// to provide all required members of the contract.

// IMPLEMENT TWICE
// Multiple classes can implement the same contract.
// EmailNotification and SmsNotification both implement Notification.

// @override
// @override shows that the method is implementing
// a method required by the contract.

// DEPEND ON CONTRACT
// Other code should depend on Notification,
// not directly on EmailNotification or SmsNotification.

// POLYMORPHISM
// Different objects can be treated as the same contract type.
//
// Notification notification = EmailNotification();
// Notification notification = SmsNotification();
//
// Both are valid because both satisfy Notification.

// SWAP IMPLEMENTATIONS
// The implementation can be changed without changing
// the code that uses the Notification contract.

// DEPENDENCY INVERSION
// High-level code depends on an abstraction
// instead of depending directly on a concrete implementation.

// Structure:
//
//              Notification
//               send()
//              /      \
//             /        \
// EmailNotification   SmsNotification
//      send()              send()

abstract class Notification {
  void send(String message);
}

class EmailNotification implements Notification {
  @override
  void send(String message) {
    print("Email sent: $message");
  }
}

class SmsNotification implements Notification {
  @override
  void send(String message) {
    print("SMS sent: $message");
  }
}

void sendNotification(Notification notification, String message) {
  notification.send(message);
}

void main() {
  Notification email = EmailNotification();
  Notification sms = SmsNotification();

  print("=== Email Notification ===");
  sendNotification(email, "Your order has been shipped.");

  print("");

  print("=== SMS Notification ===");
  sendNotification(sms, "Your order has been delivered.");
}
