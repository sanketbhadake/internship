import 'dart:io';

class Temperature{
  static double convertFahrenheit(){
    print("Enter the temp in Celsius: ");
    double temp=double.parse(stdin.readLineSync()!);
    return (temp*9/5)+32;
  }
  static double covertDegree(){
    print("Enter the temp in Fahrenheit: ");
    double temp=double.parse(stdin.readLineSync()!);
    return (temp-32)/(9/5);
  }
}