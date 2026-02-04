import 'package:intern_test_sanket/question1/common.dart';

class BankAccount {
  String _accountNumber;
  String _accountHolder;
  double _balance = 0;



  BankAccount.account(this._accountHolder, this._accountNumber);

  String get accountNumber => _accountNumber;
  String get accountholder => _accountHolder;
  double get balance => _balance;

  set setBalance(double value) {
    _balance = value;
  }

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
    } else {
      Common.printer("No balance");
    }
  }

  void withdraw(double amount) {
    if (_balance < amount || _balance < 0) {
      Common.printer("Invalid Transaction");
    } else if (_balance > 0) {
      _balance -= amount;
      Common.printer("$_balance Withdraw successfully");
    }
  }
}
