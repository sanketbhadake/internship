import 'package:project/Module3/printer.dart';

class Employee extends PrintElement {
  PrintElement printElement = PrintElement();

  int id;
  String name;
  double basicSalary;

  Employee({required this.name, required this.id, required this.basicSalary});

  double hraBasis() => (basicSalary / 100) * 20;

  double daBasis() => (basicSalary / 100) * 10;

  double grossSal() => basicSalary + hraBasis() + daBasis();
}
