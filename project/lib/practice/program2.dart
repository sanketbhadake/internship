import 'package:project/practice/program1.dart';
void main(){
  var account= Bank(200);
  print("Current balance: ${account.Balance}");

  account.balance=233;
  print("new balance: ${account.Balance}");
  account.balance=-76;

}