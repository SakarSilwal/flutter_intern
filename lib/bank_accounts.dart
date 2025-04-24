class BankAccounts {
  double _balance = 0.0;

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print("successfully deposited: $amount");
    } else {
      print("the amount is not valid");
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print("withdrawn: $amount");
    } else {
      print('invalid or insufficient balance');
    }
  }

  void balanceCheck() {
    print("current balance is $_balance");
  }
}

void main() {
  BankAccounts b1 = BankAccounts();

  b1.deposit(10000);
  b1.withdraw(5678);
  b1.balanceCheck();
}
