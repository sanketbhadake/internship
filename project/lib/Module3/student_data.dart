import 'dart:io';

import 'package:project/Module3/printer.dart';

class Student {
  PrintElement printer = PrintElement();
  final Map<String, int> _marks = {
    "Maths": 10,
    "Chemistry": 20,
    "Physics": 30,
    "English": 40,
    "Marathi": 50,
  };

  void addSubMarks() {
    List<MapEntry<String, int>> newEntries = [];
    printer.printLine("Enter the marks of subject");
    int i = 0;
    for (String key in _marks.keys) {
      stdout.write("${_marks.keys.elementAt(i)}: ");
      int marks = printer.inputData();
      newEntries.add(MapEntry(key, marks));
      i++;
    }
    // print(
    //   "key: ${_marks.keys.elementAt(3)} value: ${_marks.values.elementAt(3)} ",
    // );

    _marks.addEntries(newEntries);
    // printer.printLine(_marks);
  }

  int get totalMarks {
    int total = 0;
    for (int i = 0; i < _marks.length; i++) {
      total += _marks.values.elementAt(i);
    }
    return total;
  }

  double get percentage {
    int total = totalMarks;
    return (total / 5);
  }

  String get grade {
    if (percentage >= 85) {
      return "A";
    } else if (percentage >= 70) {
      return "B";
    } else if (percentage >= 55) {
      return "C";
    } else {
      return "F";
    }
  }

  void summery() {
    printer.printLine("Total Marks: $totalMarks");
    printer.printLine("Total Percentage: $percentage %");
    printer.printLine("Grade: $grade");
  }
}
