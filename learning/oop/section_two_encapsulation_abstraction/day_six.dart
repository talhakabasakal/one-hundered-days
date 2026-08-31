//Day 6: Encapsulation & Abstraction - Hiding Internal State

//----------------------------------------------------------

//Make State Private

//class BankAccount {
//double _balance;

//BankAccount(this._balance);
//}

//----------------------------------------------------------

//Controlled Updates

//class BankAccount {
//double _balance;

//BankAccount(this._balance) {
//  if (_balance < 0) {
//    throw ArgumentError("Initial balance cannot be negative.");
//  }
//}

//void deposit(double amount) {
//  if (amount <= 0) {
//throw ArgumentError("Deposit amount must be positive.");
//  }

//  _balance += amount;
//}

//void withdraw(double amount) {
//if (amount <= 0) {
//throw ArgumentError("Withdrawal amount must be positive.");
//}

//if (amount > _balance) {
//throw ArgumentError("Insufficient balance.");
//}

//_balance -= amount;
//}
//}

//account.deposit(200);
//account.withdraw(100);

//----------------------------------------------------------

//Read Access — Getter

//double get balance => _balance;

//double get balance => _balance;

//account.balance = 5000;

//----------------------------------------------------------

class BankAccount {
  double _balance;

  BankAccount(this._balance) {
    if (_balance < 0) {
      throw ArgumentError("Initial balance cannot be negative.");
    }
  }

  void deposit(double amount) {
    if (amount <= 0) {
      throw ArgumentError("Deposit amount must be positive.");
    }

    _balance += amount;
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      throw ArgumentError("Withdrawal amount must be positive.");
    }

    if (amount > _balance) {
      throw ArgumentError("Insufficient balance.");
    }

    _balance -= amount;
  }

  double get balance => _balance;
}

void main() {
  BankAccount account = BankAccount(500);

  account.deposit(200);
  account.withdraw(100);

  print(account.balance);
}

//----------------------------------------------------------
