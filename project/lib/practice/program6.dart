mixin parent{
  int x=20;
}
mixin parent1{
  int x =10;
}
class child with parent,parent1{
  child(){
    print(x);
  }
}
void main(){
  child obj = child();
}