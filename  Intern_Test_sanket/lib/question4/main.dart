import 'package:intern_test_sanket/question1/common.dart';
import 'package:intern_test_sanket/question4/q4_employee.dart';

void main(){
   List<Employee> emp = [
        FullTime("sanket", 23, 30000),
        ContractEmployee("Omkar", 1, 8, 9)
   ];
   for(var element in emp ){
     Common.printer("Name: ${element.name} Salary: ${element.calculateSal()}");
   }

}