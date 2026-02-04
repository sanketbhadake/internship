void main() {

  for(int i=1;i<=10;i++){
    String row="";
    for(int j=1;j<=10;j++){
      int result=i*j;
      String cell= result.toString().padLeft(4);
      row+=cell;
    }
    print(row);

  }

}
