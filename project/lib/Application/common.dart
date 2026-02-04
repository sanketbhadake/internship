import 'dart:io';

class Common {
  static void printLine(String message) {
    print(message);
  }

  static num numberInput() {
    return num.tryParse(stdin.readLineSync() ?? "") ?? 0;
  }

  static String stringInput() {
    return stdin.readLineSync() ?? "0";
  }
}
