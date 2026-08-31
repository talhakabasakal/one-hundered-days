//Day 8: Encapsulation & Abstraction - Abstraction and Interfaces of Thought

abstract class PaymentMethod {
  void pay(double amount);
}

class CreditCardPayment implements PaymentMethod {
  @override
  void pay(double amount) {
    print("Paid $amount with credit card.");
  }
}

class BankTransferPayment implements PaymentMethod {
  @override
  void pay(double amount) {
    print("Paid $amount with bank transfer.");
  }
}

class Checkout {
  final PaymentMethod paymentMethod;

  Checkout(this.paymentMethod);

  void completeOrder(double amount) {
    print("Starting checkout...");

    paymentMethod.pay(amount);

    print("Order completed successfully.");
  }
}

void main() {
  print("=== Credit Card Payment ===");

  PaymentMethod creditCard = CreditCardPayment();
  Checkout creditCardCheckout = Checkout(creditCard);

  creditCardCheckout.completeOrder(500);

  print("");

  print("=== Bank Transfer Payment ===");

  PaymentMethod bankTransfer = BankTransferPayment();
  Checkout bankTransferCheckout = Checkout(bankTransfer);

  bankTransferCheckout.completeOrder(750);
}

//=== Credit Card Payment ===
//Starting checkout...
//Paid 500.0 with credit card.
//Order completed successfully.

//=== Bank Transfer Payment ===
//Starting checkout...
//Paid 750.0 with bank transfer.
//Order completed successfully.
