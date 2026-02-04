import 'package:project/Module2/new%20code/print.dart';

class MarkServices extends Printer {
  final Map<String, int> _marks;

  MarkServices(this._marks);


  void printAllMarks(){
    _marks.forEach((name, score ){
      Printer.printLine("$name : $score");
    });
  }

  String get topper{
    int maxMarks=0;
    String topperName="";
    _marks.forEach( (name,score){
      if(score > maxMarks){
        maxMarks=score;
        topperName=name;
      }
    });
    return topperName;
  }




}