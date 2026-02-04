class Player {
 void info(){
   print("IPL player");
 }
}
class Virat extends Player{
  void info1(){
    print("Virat ");

  }
}
class MSD extends Player{
  void info2(){
    print("MSD ");

  }

}
void main(){
  MSD obj = MSD();
  obj.info();
  obj.info2();
}