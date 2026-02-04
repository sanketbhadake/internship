import 'dart:io';

import 'package:project/Module2/new%20code/print.dart';

class Number{

  int inputData( ){
    return int.parse(stdin.readLineSync()??"0");
  }
  bool isEven(num number){
    return number%2==0;
  }

  void printNumbers(){
    for(int i=1;i<=10;i++){
      if(i==5) continue;
      Printer.printLine(i);
    }
  }
  String numberType(int num){
    if(num<0) return "Number is Negative";
    if(num>0) return "Number is Positive";
     return "zero";
  }

  int factorial(int num ){
    int result=1;
    for(int i=1;i<=num;i++){
      result*=i;
    }
    return result;
  }
  String getDay(int num){
    switch(num){
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Saturday";
      case 7:
        return "Sunday";
      default:
        return "Invalid Day";
    }
  }
}