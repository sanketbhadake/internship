import 'dart:io';

import 'package:project/Module3/model/common.dart';
import 'package:project/Module3/model/student.dart';
import 'package:project/Module3/model/student_model.dart';

void main() {
  Student student = Student();
  CommonLogic.printLine("Enter the 3 students data");
  for (int i = 0; i < 3; i++) {
    stdout.write("Enter the name: ");

    String name = stdin.readLineSync() ?? "0";

    stdout.write("Enter the marks: ");
    int marks = CommonLogic.inputData();

    Student.studentList.add(StudentModel(name: name, marks: marks));
  }

  CommonLogic.printLine("-----------------------------------");

  CommonLogic.printLine("Students list");
  student.viewData();
  CommonLogic.printLine("-----------------------------------");

  student.summery();
}
