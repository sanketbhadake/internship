import 'package:intern_test_sanket/question1/common.dart';
import 'package:intern_test_sanket/question3/BankAccount.dart';

void main() {
  Common.printer("Enter the Account holder name");
  String name = Common.inputs();

  Common.printer("Enter the Account no");
  String accountNum = Common.inputs();

  BankAccount bank = BankAccount.account(name, accountNum);
  while(true) {
  Common.printer("Enter your choice");
  Common.printer('''
  1.Deposit amount
  2.Withdraw amount
  3.check balance
  ''');
  int choice = int.parse(Common.inputs());

  switch (choice) {
    case 1:
      Common.printer("Enter amount to deposit");
      double depo = double.parse(Common.inputs());
      bank.deposit(depo);
    case 2:
      Common.printer("Enter amount to withdraw");
      double withdraw = double.parse(Common.inputs());
      bank.withdraw(withdraw);


    case 3:
      Common.printer(" Account name : ${bank.accountholder}");
      Common.printer("Current balance : ${bank.balance}");
  }
}
}
