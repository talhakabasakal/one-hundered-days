//Day 9: Encapsulation & Abstraction - Immutable vs Mutable Design

//----------------------------------------------------------

//Mutable: Var olan nesnenin içindeki değer değişir.
//Immutable: Var olan nesne değişmez; değişiklik gerektiğinde yeni bir nesne oluşturulur.

// Immutable Object
// An immutable object cannot be changed after it is created.

// "final" means the value can only be assigned once.
// The total value cannot be changed after the object is created.

// "const" allows the object to be created as a constant
// when all provided values are constant.

// addPrice() does not change the current object.
// Instead, it creates and returns a new ImmutableCart.

// Validation:
// The price must be greater than zero.

// Example:
// Original cart total: 500
// Add price: 200
// Original cart stays: 500
// New cart becomes: 700

//----------------------------------------------------------

class MutableCart {
  double total;

  MutableCart(this.total);

  void addPrice(double price) {
    if (price <= 0) {
      throw ArgumentError("Price must be greater than zero.");
    }

    total += price;
  }
}

class ImmutableCart {
  final double total;

  const ImmutableCart(this.total);

  ImmutableCart addPrice(double price) {
    if (price <= 0) {
      throw ArgumentError("Price must be greater than zero.");
    }

    return ImmutableCart(total + price);
  }
}

void main() {
  print("=== Mutable Cart ===");

  MutableCart mutableCart = MutableCart(500);

  print("Before: ${mutableCart.total}");

  mutableCart.addPrice(200);

  print("After: ${mutableCart.total}");

  print("");

  print("=== Immutable Cart ===");

  ImmutableCart originalCart = ImmutableCart(500);
  ImmutableCart newCart = originalCart.addPrice(200);

  print("Original cart: ${originalCart.total}");
  print("New cart: ${newCart.total}");
}
