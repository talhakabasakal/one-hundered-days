//Day 7: Encapsulation & Abstraction - Invariants and Validation

//1. List Invariants

// Invariants:
// 1. Balance cannot be negative.
// 2. Deposit amount must be greater than zero.
// 3. Withdrawal cannot exceed the current balance.

class BankAccount {
  double _balance;

  // Invariants:
  // 1. Balance cannot be negative.
  // 2. Deposit amount must be greater than zero.
  // 3. Withdrawal cannot exceed the current balance.

  BankAccount(this._balance) {
    if (_balance < 0) {
      throw ArgumentError("Initial balance cannot be negative.");
    }
  }

  void deposit(double amount) {
    if (amount <= 0) {
      throw ArgumentError("Deposit amount must be greater than zero.");
    }

    _balance += amount;
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      throw ArgumentError("Withdrawal amount must be greater than zero.");
    }

    if (amount > _balance) {
      throw StateError("Insufficient balance.");
    }

    _balance -= amount;
  }

  double get balance => _balance;
}

void main() {
  BankAccount account = BankAccount(500);

  account.deposit(200);
  account.withdraw(100);

  print("Current balance: ${account.balance}");
}
