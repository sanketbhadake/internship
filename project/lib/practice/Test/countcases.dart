

void main() {
  // String ch = "sadSAD21314@@#!";
  // int lowerCount = RegExp(r'[a-z]').allMatches(ch).length;
  // print(lowerCount);
  // int upperCount = RegExp(r'[A-Z]').allMatches(ch).length;
  // print(upperCount);
  //
  // int digitCount = RegExp(r'[0-9]').allMatches(ch).length;
  // print(digitCount);
  // int specialCount = RegExp(r'[^a-zA-Z0-9]').allMatches(ch).length;
  // print(specialCount);

  int a=114556;
  int frequncy=0;
  String count =a.toString();
  print(count.length);
  int b=11;
  String digit=b.toString();
  for(int i=0;i<count.length;i++){
    if(count[i]==digit){
      frequncy++;
    }
  }
  print("Frequency of $digit in $a is $frequncy");
}
