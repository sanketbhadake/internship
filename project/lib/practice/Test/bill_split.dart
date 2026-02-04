import 'dart:io';

void main(){

  print("Enter the bill amount");
  double bill= double.parse(stdin.readLineSync()??"0");

  print("how many friends included in split");
  int splitCount= int.parse(stdin.readLineSync()??"0");

  double country =bill/splitCount;

  print("Amount for per person is $country");
}
