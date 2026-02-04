import 'dart:io';
import 'package:project/Module1/average.dart';
import 'package:project/Module1/area.dart';
import 'package:project/Module1/calculator.dart';
import 'package:project/Module1/temperature.dart';
import 'package:project/Module1/leapYear.dart';

void main(){
  while(true){
    try {
      print("Enter the 1-5 to check exercise ");
      int choice = int.parse(stdin.readLineSync()!);
      switch (choice) {
        case 1:
          print("Enter the length of rectangle : ");
          double length = double.parse(stdin.readLineSync()!);

          print("Enter the width of rectangle : ");
          double width = double.parse(stdin.readLineSync()!);
          print("Area of rectangle: ${Area.calculateArea(length, width)}");
          print("Perimeter of rectangle: ${Area.calculatePerimeter(
              length, width)}");

        case 2:
          print("Average of Marks: ${Avg.average()}");
        case 3:
          print("Choose options:\n"
              "1. Addition\n"
              "2. Subtraction\n"
              "3. Multiplication\n"
              "4. Division\n"
          );

          int num = int.parse(stdin.readLineSync()!);
          if(num>4 || num<0){
            print("Invalid option");
            break;
          }

          print("Enter the number ");

          int num1 = int.parse(stdin.readLineSync()!);
          int num2 = int.parse(stdin.readLineSync()!);

          switch (num) {
            case 1:
              print("Addition is : ${Calculator.add(num1, num2)}");
              break;

            case 2:
              print("Subtraction is : ${Calculator.sub(num1, num2)}");
              break;

            case 3:
              print("Multiplication is : ${Calculator.mul(num1, num2)}");
              break;

            case 4:
              print("Division is : ${Calculator.div(num1, num2)}");
              break;
            default :
              print("Invalid option");
          }

        case 4:
          print("choose option :");
          print("1.Convert temp into Celsius"
              "\n2.Convert temp into Fahrenheit");
          int option = int.parse(stdin.readLineSync()!);
          switch (option) {
            case 1:
              print("${Temperature.covertDegree()} C");
            case 2:
              print("${Temperature.convertFahrenheit()} F");
            default:
              print("Invalid option");
          }
        case 5:
            print(LeapYear.checkIsLeap());

        default:
          print("Invalid Inputs");
      }
    } on FormatException{
      print("Invalid Input.. Try again");
    }
  }
}