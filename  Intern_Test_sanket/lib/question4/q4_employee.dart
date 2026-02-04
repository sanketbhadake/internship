class Employee {
  String? name;
  int? id;

  Employee(this.name, this.id);

  double calculateSal() {
    return 0;
  }
}

class FullTime extends Employee {
  double monthlySal;

  FullTime(String name, int id, this.monthlySal) : super(name, id);

  @override
  double calculateSal() {
    return monthlySal;
  }
}

class ContractEmployee extends Employee {
  double hourlyRate;
  double hoursWorked;

  ContractEmployee(String name, int id, this.hourlyRate, this.hoursWorked)
    : super(name, id);

  @override
  double calculateSal() {
    return hoursWorked * hourlyRate;
  }
}
