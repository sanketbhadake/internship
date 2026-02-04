abstract class Vehicle{
  void start();
  void stop();
}
class Car extends Vehicle{
  @override
  void start(){
    print("car started");
  }
  @override
  void stop(){
    print("car stop");
  }

}
class Bike extends Vehicle{
  @override
  void start(){
    print("Bike started");
  }
  @override
  void stop(){
    print("Bike stop");
  }

}
void main(){
  Car obj = Car();
  obj.start();
  obj.stop();

}