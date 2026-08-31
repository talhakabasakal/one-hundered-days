// Day 20: SOLID, Patterns & Practice - Capstone Model & Review

// --------------------------------------------------
// CAPSTONE PROJECT
// --------------------------------------------------

// A capstone project combines the OOP concepts
// learned throughout the course into one small project.

// In this example, we build a simple shop order system.

// --------------------------------------------------
// ENCAPSULATION
// --------------------------------------------------

// Internal object state should be protected.

// Fields such as price and quantity are private.

// Objects expose controlled methods and getters
// instead of allowing unrestricted modification.

// --------------------------------------------------
// INVARIANTS
// --------------------------------------------------

// Objects must always remain in a valid state.

// Product price cannot be negative.

// Cart item quantity must be greater than zero.

// Invalid values are rejected immediately.

// --------------------------------------------------
// ABSTRACTION
// --------------------------------------------------

// PaymentMethod defines a contract.

// The checkout process depends on this abstraction
// instead of depending on a specific payment class.

// --------------------------------------------------
// POLYMORPHISM
// --------------------------------------------------

// Different payment implementations can satisfy
// the same PaymentMethod contract.

// CardPayment and CashPayment provide
// different implementations of pay().

// The checkout process can use either implementation.

// --------------------------------------------------
// SOLID
// --------------------------------------------------

// Single Responsibility Principle:
//
// Product manages product information.
// CartItem manages quantity and subtotal.
// ShoppingCart manages cart operations.
// PaymentMethod manages the payment contract.

// --------------------------------------------------
// OPEN/CLOSED PRINCIPLE
// --------------------------------------------------

// New payment methods can be added
// without changing ShoppingCart.

// For example:
//
// CardPayment
// CashPayment
// MobilePayment
//
// can all implement PaymentMethod.

// --------------------------------------------------
// STRATEGY PATTERN
// --------------------------------------------------

// PaymentMethod acts as a payment strategy.

// Different payment algorithms can be swapped
// without changing the checkout logic.

// --------------------------------------------------
// COHESIVE MODEL
// --------------------------------------------------

// Each class has a clear responsibility.

// Product
//   -> stores product information
//
// CartItem
//   -> connects a product with a quantity
//
// ShoppingCart
//   -> manages items and checkout
//
// PaymentMethod
//   -> defines payment behavior

// --------------------------------------------------
// COURSE REVIEW
// --------------------------------------------------

// During this OOP course we practiced:
//
// Classes and Objects
// Constructors
// Encapsulation
// Abstraction
// Invariants
// Validation
// Mutable and Immutable Design
// Inheritance
// Method Overriding
// Polymorphism
// Interfaces
// Abstract Classes
// Composition
// SOLID Principles
// Factory Pattern
// Strategy Pattern
// Observer Pattern
// Refactoring

// --------------------------------------------------
// FINAL IDEA
// --------------------------------------------------

// Good OOP is not about creating many classes.

// Good OOP is about:
//
// clear responsibilities,
// protected state,
// useful abstractions,
// low coupling,
// and maintainable code.

class Product {
  final String _name;
  final double _price;

  Product(this._name, this._price) {
    if (_name.trim().isEmpty) {
      throw ArgumentError("Product name cannot be empty.");
    }

    if (_price < 0) {
      throw ArgumentError("Product price cannot be negative.");
    }
  }

  String get name => _name;

  double get price => _price;
}

class CartItem {
  final Product product;
  int _quantity;

  CartItem(this.product, this._quantity) {
    if (_quantity <= 0) {
      throw ArgumentError("Quantity must be greater than zero.");
    }
  }

  int get quantity => _quantity;

  double get subtotal => product.price * _quantity;

  void increaseQuantity(int amount) {
    if (amount <= 0) {
      throw ArgumentError("Amount must be greater than zero.");
    }

    _quantity += amount;
  }
}

abstract class PaymentMethod {
  void pay(double amount);
}

class CardPayment implements PaymentMethod {
  @override
  void pay(double amount) {
    print("Paid \$${amount.toStringAsFixed(2)} by card.");
  }
}

class CashPayment implements PaymentMethod {
  @override
  void pay(double amount) {
    print("Paid \$${amount.toStringAsFixed(2)} with cash.");
  }
}

class ShoppingCart {
  final List<CartItem> _items = [];

  void addProduct(Product product, int quantity) {
    if (quantity <= 0) {
      throw ArgumentError("Quantity must be greater than zero.");
    }

    _items.add(CartItem(product, quantity));
  }

  double get total {
    double result = 0;

    for (CartItem item in _items) {
      result += item.subtotal;
    }

    return result;
  }

  void showCart() {
    print("=== Shopping Cart ===");

    for (CartItem item in _items) {
      print(
        "${item.product.name} x${item.quantity} "
        "= \$${item.subtotal.toStringAsFixed(2)}",
      );
    }

    print("Total: \$${total.toStringAsFixed(2)}");
  }

  void checkout(PaymentMethod paymentMethod) {
    if (_items.isEmpty) {
      throw StateError("Cannot checkout an empty cart.");
    }

    paymentMethod.pay(total);

    print("Checkout completed.");
  }
}

void main() {
  Product laptop = Product("Laptop", 1200);

  Product mouse = Product("Mouse", 50);

  ShoppingCart cart = ShoppingCart();

  cart.addProduct(laptop, 1);
  cart.addProduct(mouse, 2);

  cart.showCart();

  print("");

  PaymentMethod paymentMethod = CardPayment();

  cart.checkout(paymentMethod);
}
