

void main() {
  int a=10;
  int b=20;

  a=a+b;
  b=a-b;
  a=a-b;

  print(a);
  print(b);

  String name="Sanket bhadake hello";
  print(name.replaceAll( RegExp(r'(\s)'), ''));


}
