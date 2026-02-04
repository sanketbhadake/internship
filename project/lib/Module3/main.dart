import 'dart:io';

import 'package:project/Module3/dynamic_list.dart';
import 'package:project/Module3/printer.dart';
import 'package:project/Module3/student_data.dart';

import 'employe.dart';

void main(){
  PrintElement printer =PrintElement();
  Student student = Student();
  DynamicList dl= DynamicList();

    do {
      printer.printLine("Enter the choice ");
      printer.printLine("1.Student Result Analyzer\n2.Employee Salary Calculator \n3.Dynamic List");
      int choice = printer.inputData();
      switch (choice) {
        case 1:
          student.addSubMarks();
          student.summery();

        case 2:
          stdout.write("Enter Employee ID: ");
          int id = printer.inputData();

          stdout.write("Enter Employee Name: ");
          String name = stdin.readLineSync()??"0";

          stdout.write("Enter Basic Salary: ");
          double basicSalary =  double.parse(stdin.readLineSync()??"0");

          Employee employee = Employee(name: name, id: id, basicSalary: basicSalary);

          printer.printLine("HRA : ${employee.hraBasis()}");
          printer.printLine("DA : ${employee.daBasis()}");
          printer.printLine("Gross sal : ${employee.grossSal()}");

        case 3:

          dl.addData();
          printer.printLine("Integer List: ${dl.integerData()}");
          printer.printLine("Boolean List: ${dl.booleData()}");
          printer.printLine("Double List: ${dl.doubleData()}");




        default:
          printer.printLine("Invalid option.. Try again");
      }
    }
  while(true);
  }
