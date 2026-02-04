import 'dart:io';

import 'package:project/Module3/printer.dart';

class DynamicList {
  PrintElement printElement = PrintElement();
  List<dynamic> data = [];

  void addData() {
    printElement.printLine("Enter the size of list:");
    int size = printElement.inputData();

    for (int i = 0; i < size; i++) {
      printElement.printLine("Enter value ${i + 1}:");
      String userInput = stdin.readLineSync() ?? "";

      // TYPE DETECTION LOGIC
      var convertedValue;
      if (int.tryParse(userInput) != null) {
        convertedValue = int.parse(userInput);
      } else if (double.tryParse(userInput) != null) {
        convertedValue = double.parse(userInput);
      } else if (userInput.toLowerCase() == "true") {
        convertedValue = true;
      } else if (userInput.toLowerCase() == "false") {
        convertedValue = false;
      } else {
        convertedValue = userInput;
      }

      data.add(convertedValue);
    }
    printElement.printLine("Successfully added: $data");
  }


  List<int> integerData() => data.whereType<int>().toList();
  List<double> doubleData() => data.whereType<double>().toList();
  List<bool> booleData() => data.whereType<bool>().toList();
}
