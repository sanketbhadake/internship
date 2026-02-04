void main() {
  String name = "121";
  name = name.replaceAll(RegExp(r'/s'), " ");
  String rev=name.split('').reversed.join();
  if(name==rev){
    print("palindrome");
  }

}
