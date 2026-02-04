import 'dart:io';

class Printer {
  static dynamic printLine(dynamic message) {
    return print(message);
  }

  static int input() {
    return int.parse(stdin.readLineSync() ?? "0");
  }


}


class inputFunc {
  static dynamic inputs() {
    return stdin.readLineSync()!;
  }

  String a = inputs();
}