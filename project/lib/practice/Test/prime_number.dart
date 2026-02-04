import 'dart:io';

class Prime {
  bool isPrime(int a) {
    int count = 0;
    for (int i = 1; i <= a; i++) {
      if (a % i == 0) {
        count++;
      }
    }
    print(count);
    if (count == 2) {
      return true;
    } else {
      return false;
    }
  }
}

void main() {
  int? a;

  while (true) {
    Prime p = Prime();
    print("Enter the integer value");
    a = int.tryParse(stdin.readLineSync()!);

    if (a == null) {
      print("Incorrect input try again");
      continue;
    }
      if(a<0){
        print("Negative numbers not allow");
        continue;
      }
      print(a);
      if (p.isPrime(a)) {
        print("Number is prime");
      } else {
        print("Not prime");
      }
    }

}
