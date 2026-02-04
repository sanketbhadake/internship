import 'dart:io';
class Avg{
  static double average(){
    double sum=0;
     print("Enter the 5 subject marks ");
    List<double> marks=[];
    for(int i =0;i<5;i++){
      marks.add(double.parse(stdin.readLineSync()!));
    }
    for(int i=0;i<marks.length;i++ ){
     sum+= marks[i];
    }
    return (sum/marks.length);
  }
}
