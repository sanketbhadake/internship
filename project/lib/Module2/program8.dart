void main(){
  Map<String,int> marks= {
    'Sanket':46,
    'Aniket':87,
    'Omakr':96,
    'Sarthak':58,
    'Sahil':78

  };
  int highMarks=0;
  int key=0;
  for(int i=0;i<marks.length;i++){
    if(marks.values.elementAt(i)>highMarks){

     highMarks= marks.values.elementAt(i);
     key=i;
    }
  }
  print("Highest marks student");
  print("Student name: ${ marks.keys.elementAt(key)} \n marks:  ${ marks.values.elementAt(key)} ");
}