import 'dart:io';

class Common {
  static void printer(String message){
    print(message);
  }
  static dynamic inputs(){
    return stdin.readLineSync()!;
  }

}