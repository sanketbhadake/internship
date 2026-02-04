import 'dart:io';

class CommonLogic {
  static void printLine(String message) => print(message);

  static dynamic inputData() {
    return num.parse(stdin.readLineSync() ?? "0");
  }
}
