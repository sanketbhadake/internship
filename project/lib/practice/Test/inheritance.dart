import 'package:project/practice/program6.dart';

abstract class Shape {
  double calculateArea();

  void printArea() {
    print(calculateArea());
  }
}

class Circle extends Shape {
  final double radius;

  Circle(this.radius);

  @override
  double calculateArea() {
    return 3.14 * radius * radius;
  }
}

class Rectangle extends Shape {
  final double length;
  final double width;

  Rectangle(this.length, this.width);

  @override
  double calculateArea() {
    return length * width;
  }
}

void main() {
  Circle circle = Circle(45);
  circle.calculateArea();
  circle.printArea();

  Rectangle rectangle = Rectangle(20, 10);
  rectangle.calculateArea();
  rectangle.printArea();
}

abstract class Demo {
  void fun();
}

abstract class Memo {
  void run();
}

mixin FunMethod on Demo {
  
}

class Child extends Demo with FunMethod {
  void fun() {}
}
