import 'package:intern_test_sanket/question2/q2_student_processor.dart';



void main(){
  List<Map<String, dynamic>> studentScores = [
    {'name': 'Alice', 'scores': [85, 90, 88]},
    {'name': 'Bob', 'scores': [70, 65, 75]},
    {'name': 'Charlie', 'scores': [95, 92, 98]},
    {'name': 'Diana', 'scores': [50, 45, 55]},
  ];


  Student std= Student();
  std.dataProcess(studentScores);
}