void main() {
  int a = 23;
  int b = 93;
  int gcdnum = a.gcd(b);
  print(gcdnum);

  while (b != 0) {
    int remainder = a % b;
    a = b;
    b = remainder;
  }
  print(a);


  int gcdNum(int a, int b) {
    if (a == 0) {
      return b;
    }
    while (b != 0) {
      int remain = a % b;
      a = b;
      b = remain;
    }
    return a;
  }
  int lcmNum(int a, int b){
    if(a==0||b==0){
      return 0;
    }
    return (a*b)~/gcdNum(a,b);
  }


  print("GCD : ${gcdNum(12,32)}  LCD: ${lcmNum(12,32)}" );

/// finds length of string
  String str="sanket bhadake";
  int count=0;
  for(final _ in str.codeUnits){
    count++;
  }
  print(count);
}
