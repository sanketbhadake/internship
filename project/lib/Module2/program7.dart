void main(){
  Map<String,int> marks= {
  'Sanket':46,
    'Aniket':87,
    'Omakr':96,
    'Sarthak':58,
    'Sahil':78

  };
  for(int i=0;i<marks.length;i++){
     print("Student name: ${ marks.keys.elementAt(i)} \n marks:  ${ marks.values.elementAt(i)} ");
  }

}