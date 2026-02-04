import 'dart:io';
class Area {
  static double calculateArea(double length, double width) {

    return length * width;
  }

  static double calculatePerimeter(double length, double width) {
    return 2 * (length + width);
  }
}
