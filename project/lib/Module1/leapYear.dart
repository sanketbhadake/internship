import 'dart:io';

class LeapYear{

  static String checkIsLeap(){
    print("Enter the year : ");

    int year=int.parse(stdin.readLineSync()!);
    if(year%4==0 && year%100!=0 || year%400==0) {
      return "Is a leap year";
    } else {
      return "Is not leap year";
    }
  }
}

