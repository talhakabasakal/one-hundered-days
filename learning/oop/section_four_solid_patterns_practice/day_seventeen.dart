// Day 17: SOLID, Patterns & Practice - LSP, ISP, and DIP

// --------------------------------------------------
// LSP - LISKOV SUBSTITUTION PRINCIPLE
// --------------------------------------------------

// A subtype should be usable anywhere
// its base type is expected.

// Replacing a base type with a subtype
// should not break the program.

// Example:
// EmailNotification and SMSNotification
// both implement NotificationSender.

// Code using NotificationSender should work
// correctly with either implementation.

// BAD DESIGN:
// A subtype implements a method but throws
// UnsupportedError because it cannot actually perform it.

// GOOD DESIGN:
// Every implementation should respect
// the contract of its abstraction.

// --------------------------------------------------
// ISP - INTERFACE SEGREGATION PRINCIPLE
// --------------------------------------------------

// Classes should not be forced to depend
// on methods they do not need.

// BAD DESIGN:
// One large interface contains:
// send()
// print()
// save()
// export()

// A class may only need send(),
// but it is forced to implement everything.

// GOOD DESIGN:
// Split large interfaces into smaller,
// focused contracts.

// Example:
// NotificationSender
// NotificationLogger

// A class implements only the contracts
// that it actually needs.

// --------------------------------------------------
// DIP - DEPENDENCY INVERSION PRINCIPLE
// --------------------------------------------------

// High-level code should depend on abstractions,
// not concrete implementations.

// BAD DESIGN:
// NotificationService creates EmailNotification directly.

// This tightly couples NotificationService
// to one specific implementation.

// GOOD DESIGN:
// NotificationService depends on NotificationSender.

// The concrete implementation is provided
// from outside.

// This is called dependency injection.

// --------------------------------------------------
// VIOLATION HINT
// --------------------------------------------------

// LSP violation:
// A subtype cannot correctly perform
// the behavior promised by its base type.

// ISP violation:
// A class is forced to implement methods
// that it does not use.

// DIP violation:
// High-level code directly creates or depends
// on a concrete low-level class.

// --------------------------------------------------
// RULE OF THUMB
// --------------------------------------------------

// LSP:
// Subtypes must respect the base contract.

// ISP:
// Prefer small and focused interfaces.

// DIP:
// Depend on abstractions, not concrete classes.

abstract class NotificationSender {
  void send(String message);
}

abstract class NotificationLogger {
  void log(String message);
}

class EmailNotification implements NotificationSender {
  @override
  void send(String message) {
    print("Email sent: $message");
  }
}

class SMSNotification implements NotificationSender {
  @override
  void send(String message) {
    print("SMS sent: $message");
  }
}

class ConsoleLogger implements NotificationLogger {
  @override
  void log(String message) {
    print("Log: $message");
  }
}

class NotificationService {
  final NotificationSender sender;
  final NotificationLogger logger;

  NotificationService(this.sender, this.logger);

  void notify(String message) {
    sender.send(message);
    logger.log("Notification completed.");
  }
}

void main() {
  NotificationLogger logger = ConsoleLogger();

  NotificationSender emailSender = EmailNotification();

  NotificationService emailService = NotificationService(emailSender, logger);

  print("=== Email Notification ===");
  emailService.notify("Your order has been shipped.");

  print("");

  NotificationSender smsSender = SMSNotification();

  NotificationService smsService = NotificationService(smsSender, logger);

  print("=== SMS Notification ===");
  smsService.notify("Your order has been delivered.");
}
