import 'dart:io';

void main() {
  print("Hello I am 'John Doe'");
  print('''Hello I am "John Doe" ''');

  print('Enter the balance');
  double balance = double.parse(stdin.readLineSync() ?? "0");
  BankAccount bankAccount = BankAccount(balance);
  print(bankAccount.getBalance);

  print('Set the balance');
  double setBalance = double.parse(stdin.readLineSync() ?? "0");
  bankAccount.setBalance = setBalance;

  print(bankAccount.getBalance);
}

class BankAccount {
  double _balance;

  BankAccount(this._balance);

  double get getBalance {
    return _balance;
  }

  set setBalance(double bal) {
    _balance = bal;
  }
}
