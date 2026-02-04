import 'dart:io';

void main() {
  // var input = stdin.readLineSync()??"0";
  bool flag = true;
  int? a;
  String? name;
  while (flag) {
    print("Enter the value");
    a = int.tryParse(stdin.readLineSync()!);


    print("Enter the String");
    name = stdin.readLineSync()!;

    if (a == null) {
      print("Enter the right value");
      continue;
    } else if (name.isEmpty) {
      print("String is empty");
      continue;
    }
    print(a);
    print(name);
    flag = false;
  }
}
