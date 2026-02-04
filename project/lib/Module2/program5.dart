import 'dart:io';

void main(){
  print("Enter the 1-7 for day");
  int choice= int.parse(stdin.readLineSync()?? '0');
  switch(choice){
    case 1:
      print("Monday");
    case 2:
      print("Tuesday");
    case 3:
      print("Wednesday");
    case 4:
      print("Thursday");
    case 5:
      print("Friday");
    case 6:
      print("Saturday");
    case 7:
      print("Sunday");
    default:
      print("Invalid options");






  }
}