
import 'package:project/Module2/new%20code/map_service.dart';
import 'package:project/Module2/new%20code/print.dart';
import 'List_services.dart';
import 'check_num.dart';

void main() {
  Number number = Number();

  ListServices listServices = ListServices();

  MarkServices markServices = MarkServices({
    'Sanket': 70,
    'Sarthak': 85,
    'Sahil': 60,
  });

  while (true) {
    Printer.printLine("Enter your choice 1--7");
    int choice = number.inputData();
    switch (choice) {
      case 1:
        Printer.printLine("Enter the number");
        int checkNum = number.inputData();
        Printer.printLine(
          "$checkNum is ${number.isEven(checkNum) ? "Even" : "Odd"}",
        );

      case 2:
        Printer.printLine("Printing 1-10 numbers (skip 5)");
        number.printNumbers();

      case 3:
        Printer.printLine("Enter the number for factorial");
        int fact = number.inputData();
        Printer.printLine("Factorial of $fact : ${number.factorial(fact)}");

      case 4:
        Printer.printLine("Enter the number to check type");
        int checkType = number.inputData();
        Printer.printLine("$checkType is ${number.numberType(checkType)}");

      case 5:
        Printer.printLine("Enter the day number");
        int day = number.inputData();
        Printer.printLine("Get Day : ${number.getDay(day)}");

      case 6:
        listServices.summery();
      case 7:
        Printer.printLine(markServices.topper);

      default:
        Printer.printLine("Invalid option.. try again");
    }
  }
}
