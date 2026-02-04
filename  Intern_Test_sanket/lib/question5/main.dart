import 'package:intern_test_sanket/question5/q5_smart_device.dart';

void main() {
  SmartBulb sb = SmartBulb();
  sb.turnOn();
  sb.connectToNetwork("cvb");
  sb.changeColor("black");
}
