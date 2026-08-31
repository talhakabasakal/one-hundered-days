// Day 16: SOLID, Patterns & Practice - SRP and OCP

// SOLID
// SOLID is a set of object-oriented design principles
// that helps make software easier to maintain and extend.

// --------------------------------------------------
// SRP - SINGLE RESPONSIBILITY PRINCIPLE
// --------------------------------------------------

// A class should have one main responsibility
// and one reason to change.

// BAD DESIGN:
// A single Order class should not calculate totals,
// apply discounts, print receipts, and save data.

// These responsibilities can change for different reasons.

// BETTER DESIGN:
// Order handles order data and calculations.
// ReceiptPrinter handles printing.
// DiscountStrategy handles discount behavior.

// This separates responsibilities.

// --------------------------------------------------
// OCP - OPEN/CLOSED PRINCIPLE
// --------------------------------------------------

// Software should be open for extension
// but closed for modification.

// We should be able to add new behavior
// without repeatedly changing existing working code.

// BAD DESIGN:
// if (discountType == "student") { ... }
// else if (discountType == "premium") { ... }
// else if (discountType == "summer") { ... }

// Every new discount requires changing the same logic.

// BETTER DESIGN:
// Create a DiscountStrategy contract.

// Then create:
// NoDiscount
// StudentDiscount
// PremiumDiscount

// A new discount can be added by creating another class
// instead of modifying Order.

// --------------------------------------------------
// CODE SMELL
// --------------------------------------------------

// A code smell is a sign that the design
// may have a deeper structural problem.

// A class doing many unrelated jobs
// can be an SRP code smell.

// A large switch or if/else chain that changes
// every time a new type is added can be an OCP code smell.

// --------------------------------------------------
// RULE OF THUMB
// --------------------------------------------------

// SRP:
// One class = one clear responsibility.

// OCP:
// Add new behavior by adding new implementations
// instead of constantly modifying existing logic.

abstract class DiscountStrategy {
  double applyDiscount(double total);
}

class NoDiscount implements DiscountStrategy {
  @override
  double applyDiscount(double total) {
    return total;
  }
}

class StudentDiscount implements DiscountStrategy {
  @override
  double applyDiscount(double total) {
    return total * 0.90;
  }
}

class PremiumDiscount implements DiscountStrategy {
  @override
  double applyDiscount(double total) {
    return total * 0.80;
  }
}

class Order {
  final List<double> prices;
  final DiscountStrategy discountStrategy;

  Order(this.prices, this.discountStrategy);

  double calculateTotal() {
    double total = 0;

    for (double price in prices) {
      if (price < 0) {
        throw ArgumentError("Price cannot be negative.");
      }

      total += price;
    }

    return discountStrategy.applyDiscount(total);
  }
}

class ReceiptPrinter {
  void printReceipt(Order order) {
    double total = order.calculateTotal();

    print("=== Receipt ===");
    print("Total: \$${total.toStringAsFixed(2)}");
  }
}

void main() {
  Order regularOrder = Order([100, 50, 25], NoDiscount());

  Order studentOrder = Order([100, 50, 25], StudentDiscount());

  Order premiumOrder = Order([100, 50, 25], PremiumDiscount());

  ReceiptPrinter printer = ReceiptPrinter();

  print("=== Regular Order ===");
  printer.printReceipt(regularOrder);

  print("");

  print("=== Student Order ===");
  printer.printReceipt(studentOrder);

  print("");

  print("=== Premium Order ===");
  printer.printReceipt(premiumOrder);
}
