import 'dart:io';

void main(){
  print("Enter the number");
  int num=int.parse(stdin.readLineSync()?? '0');
  int fact=1;
  for(int i =1;i<=num;i++){
    fact*=i;

  }
  print("Factorial of $num is $fact");
}