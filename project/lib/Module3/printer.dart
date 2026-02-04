
import 'dart:io';

class PrintElement {
    dynamic printLine(dynamic message){
    return print(message);
  }
  dynamic inputData(){
    return num.parse(stdin.readLineSync()??"0");
  }

}