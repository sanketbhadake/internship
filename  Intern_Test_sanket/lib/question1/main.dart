import 'dart:io';
import 'package:intern_test_sanket/question1/common.dart';
import 'package:intern_test_sanket/question1/q1_string_analyzer..dart';

void main() {
  bool flag = true;
  while (flag) {
    Common.printer("Enter Your choice");
    Common.printer('''
    1. Count Vowels and Consonants.
    2: Reverse the String.
    3. Convert to Title Case (Capitalize first letter of each word).
    4. Exit. 
       ''');
    int? choice = int.tryParse(Common.inputs());
    if (choice == null) continue;

    switch (choice) {
      case 1:
        Common.printer("Enter the String");
        String str = stdin.readLineSync() ?? "0";
        MenuLogic.countVowels(str);

      case 2:
        Common.printer("Enter the String to reverse");
        String str = stdin.readLineSync() ?? "0";
        Common.printer("Reversed String : ${MenuLogic.reverseString(str)}");

      case 3:
        Common.printer("Enter String to Convert to Title Case");
        String str = stdin.readLineSync() ?? "0";
        Common.printer("String : ${MenuLogic.convertUppercase(str)}");

      case 4:
        flag = false;
      default:
        Common.printer("Invalid Inputs ");
    }
  }
}
