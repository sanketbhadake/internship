import 'dart:io';
import 'common.dart';
import 'validation.dart';

void main() {

  String userName = "";
  String password = "";
  RegExp(r'(.)1\1').hasMatch(userName);
  while (true) {
    stdout.write("Enter User Name: ");
    userName = Common.stringInput();

    String? userError = Validation.userValidation(userName);
    if (userError == null) {
      break;
    } else {
      Common.printLine(userError);
    }
  }

  while (true) {
    stdout.write("Enter the Password : ");
    password = Common.stringInput();
    String? passError = Validation.passwordValidation(userName, password);

    if (passError == null) {
      break;
    } else {
      Common.printLine(passError);
    }
  }
  Common.printLine("Login Successfully");
  Common.printLine("Welcome $userName");
}
