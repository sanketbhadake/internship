import 'package:intern_test_sanket/question1/common.dart';

class Student {
  static List<Map<String, dynamic>> studentScores = [
    {
      'name': 'Alice',
      'scores': [85, 90, 88],
    },
    {
      'name': 'Bob',
      'scores': [70, 65, 75],
    },
    {
      'name': 'Charlie',
      'scores': [95, 92, 98],
    },
    {
      'name': 'Diana',
      'scores': [50, 45, 55],
    },
  ];

  void dataProcess(List<Map<String, dynamic>> list) {
    String name = "";
    double highestScore = 0;
    String highestName = '';
    List score = [];
    for (var element in list) {
      int total = 0;
      name = element['name'];
      score = element['scores'];

      for (int sc in score) {
        total += sc;
      }
      double avg = total / score.length;
      String? grade = "";
      if (avg >= 90) {
        grade = 'A';
      } else if (avg >= 80) {
        grade = 'B';
      } else if (avg >= 70) {
        grade = 'c';
      } else if (avg < 70) {
        grade = 'D';
      }

      Common.printer("$name\t${avg.toStringAsFixed(2)}\t$grade\t");
      if (avg > highestScore) {
        highestScore = avg;
        highestName = element['name'];
      }
    }
    print("Higher name: $highestName  Score: $highestScore");
  }
}
