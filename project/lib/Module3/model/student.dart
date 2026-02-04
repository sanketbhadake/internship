
import 'package:project/Module3/model/common.dart';
import 'package:project/Module3/model/student_model.dart';

class Student {
  static List<StudentModel> studentList = [];

  void viewData() {
    for (StudentModel element in studentList) {
      CommonLogic.printLine("Student name: ${element.name} Marks: ${element.marks}");
    }
  }

  void summery() {
    CommonLogic.printLine("Highest marks: ${Student.getHighest(studentList)}");
    CommonLogic.printLine("Lowest marks: ${Student.getLowest(studentList)}");
    CommonLogic.printLine("-----------------------------------");
    CommonLogic.printLine("sort marks: ${Student.sortMarks(studentList)}");
    CommonLogic.printLine("sort name: ${Student.sortName(studentList)}");
  }

  static String getHighest(List<StudentModel> list) {
    int high= studentList[0].marks;
    int key=0;
    for(int i=1;i<list.length;i++){
      if(high<studentList[i].marks){
        high=studentList[i].marks;
        key=i;

      }
    }
    return  studentList[key].name;
  }


  static String getLowest(List<StudentModel> list) {
    int low= studentList[0].marks;
    int key=0;
    for(int i=1;i<list.length;i++){
      if(low > studentList[i].marks){
        low=studentList[i].marks;
        key=i;
      }
    }
    return  studentList[key].name;
  }


  static List<StudentModel> sortMarks(List<StudentModel> list) {
    List<StudentModel> sorted = List.from(list);
    sorted.sort((a, b) => a.marks.compareTo(b.marks));
    return sorted;
  }

  static List<StudentModel> sortName(List<StudentModel> list) {
    List<StudentModel> sorted = List.from(list);
    sorted.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    return sorted;
  }
}
