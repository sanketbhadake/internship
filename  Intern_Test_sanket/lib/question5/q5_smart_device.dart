import 'package:intern_test_sanket/question1/common.dart';

abstract class Device {
  void turnOn();
}

mixin WiFiEnabled {
  void connectToNetwork(String ssid) {
    Common.printer("Connected to $ssid");
  }
}

class SmartBulb extends Device with WiFiEnabled {
  void turnOn() {
    Common.printer("Bulb is glowing...");
  }

  void changeColor(String color) {
    Common.printer("Color is white");
  }
}
