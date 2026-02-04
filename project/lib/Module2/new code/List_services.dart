

import 'dart:io';

import 'package:project/Module2/new%20code/print.dart';

class ListServices extends Printer {

  final List<int> _numbers=[];



  int get maxValue {
    int max = _numbers[0];
    for (int i in _numbers) {
      if (max < i) {
        max =i;
      }

    }
    return max;
  }

  List<int> get evenList{
    List<int> even=[];
    for(int i in _numbers){
      if(i % 2==0)even.add(i);

    }
    return even;
  }


  List<int> get uniqueList{
    List<int> unique=[];
    for(int i in _numbers){
      if(!unique.contains(i))unique.add(i);
    }
    return unique  ;
  }
  void summery(){
    Printer.printLine("Enter the number in the list");
    for(int i=0;i<5;i++){
      int data= int.parse(stdin.readLineSync()??"0");
      _numbers.add(data);
    }

    Printer.printLine("Original List : $_numbers");
    Printer.printLine("Max value : $maxValue");
    Printer.printLine("Even number: $evenList");
    Printer.printLine("Unique number: $uniqueList");

  }
}

