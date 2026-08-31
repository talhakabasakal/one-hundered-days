// Day 15: Inheritance & Polymorphism - Practice

// DESIGN CHALLENGE
// We will create a payment system.
// Different payment methods will follow the same contract.

// CONTRACT
// PaymentMethod defines what every payment method must do.
// Every payment method must implement pay().

// IMPLEMENTATIONS
// CreditCardPayment and CashPayment are different
// implementations of the PaymentMethod contract.

// POLYMORPHISM
// Different payment objects can be stored
// using the same PaymentMethod type.

// POLYMORPHIC COLLECTION
// A List<PaymentMethod> can contain different
// payment implementations.

// POLYMORPHIC LOOP
// We can loop through different payment methods
// and call the same pay() method.
// Dart selects the correct implementation at runtime.

// COMPOSITION
// CheckoutService HAS a PaymentMethod.
// CheckoutService IS NOT a PaymentMethod.
//
// Therefore, composition is more appropriate
// than inheritance.

// DELEGATION
// CheckoutService delegates the payment operation
// to the PaymentMethod object.

// SHALLOW HIERARCHY
// We avoid creating unnecessary inheritance levels.
// The design stays simple and easy to understand.

// DESIGN CRITIQUE
// Deep inheritance was intentionally avoided.
// CheckoutService does not extend a payment class.
// Instead, it receives and uses a PaymentMethod object.

// RULE OF THUMB
// Use inheritance for a true "is-a" relationship.
// Use composition for a "has-a" relationship.
// Depend on abstractions instead of concrete classes.

abstract class PaymentMethod {
  void pay(double amount);
}

class CreditCardPayment implements PaymentMethod {
  final String cardHolder;

  CreditCardPayment(this.cardHolder);

  @override
  void pay(double amount) {
    if (amount <= 0) {
      throw ArgumentError("Payment amount must be positive.");
    }

    print("$cardHolder paid \$${amount.toStringAsFixed(2)} by credit card.");
  }
}

class CashPayment implements PaymentMethod {
  @override
  void pay(double amount) {
    if (amount <= 0) {
      throw ArgumentError("Payment amount must be positive.");
    }

    print("\$${amount.toStringAsFixed(2)} was paid in cash.");
  }
}

class MobilePayment implements PaymentMethod {
  final String provider;

  MobilePayment(this.provider);

  @override
  void pay(double amount) {
    if (amount <= 0) {
      throw ArgumentError("Payment amount must be positive.");
    }

    print("\$${amount.toStringAsFixed(2)} was paid using $provider.");
  }
}

class CheckoutService {
  final PaymentMethod paymentMethod;

  CheckoutService(this.paymentMethod);

  void checkout(double amount) {
    print("Starting checkout...");

    paymentMethod.pay(amount);

    print("Checkout completed.");
  }
}

void main() {
  PaymentMethod creditCard = CreditCardPayment("Alex");

  PaymentMethod cash = CashPayment();

  PaymentMethod mobile = MobilePayment("MobilePay");

  List<PaymentMethod> paymentMethods = [creditCard, cash, mobile];

  print("=== Polymorphic Loop ===");

  for (PaymentMethod method in paymentMethods) {
    method.pay(100);
  }

  print("");

  print("=== Composition ===");

  CheckoutService checkout = CheckoutService(creditCard);

  checkout.checkout(250);
}
