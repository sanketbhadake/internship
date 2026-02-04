import 'dart:io';

void main(){
  print("Enter the number to check number is Even or odd");
  int num= int.parse(stdin.readLineSync()?? '0');
  if(num%2==0){
    print("$num is Even");
  }
  else{
    print("$num is Odd");
  }
}