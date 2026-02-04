void main(){
  // String name="madam";
  // String rev = name.split('').reversed.join();
  // String l="";
  // for(int i=name.length-1;i>=0;i--){
  //     l+=name[i];
  // }
  // print(l);
  // if(name==l)print("pali");

  String ch  ='sanket';
  int count=0;
  for(int i=0;i<ch.length;i++){
    if("aeiouAEIOU".contains(ch[i])){
      count++;
    }
  }
  print("count of owels $count");

}