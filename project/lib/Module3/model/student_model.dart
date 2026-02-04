class StudentModel {
  String name;
  int marks;

  StudentModel({required this.name, required this.marks});

  @override
  String toString() => 'Name: $name, Marks: $marks';
}
