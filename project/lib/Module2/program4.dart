import 'dart:io';

void main(){
  print("Enter the number ");
  int num =int.parse(stdin.readLineSync()?? '0');
  if(num >0){
    print("$num is positive");
  }else if(num<0){
    print("$num is Negative");
  }else{
    print("Number is Zero");
  }
}