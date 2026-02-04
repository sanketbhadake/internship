import 'dart:io';

void main() {
  double max = 0;
  int count = 0;
  print("Enter the number in the list");
  List<double> number = [];
  Set updatedList = {};
  for (int i = 0; i < 5; i++) {
    number.add(double.parse(stdin.readLineSync() ?? '0'));
  }
  print("List : $number ");

  for (int i = 0; i < number.length; i++) {
    if (number[i] % 2 == 0) {
      count++;
    }

    if (max < number[i]) {
      max = number[i];
    }
    updatedList.add(number[i]);
  }

  print("Max number in the list is : $max ");
  print("Count of even number in the list is : $count ");

  print("updated list");

  print(updatedList.toList());
}
