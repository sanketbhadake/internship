void main() {
  List<Map<String, int>> marks = [
    {'Sanket': 46, 'Aniket': 87, 'Omakr': 96, 'Sarthak': 58, 'Sahil': 78},
  ];


  // var gifts = {
  //   // Key:    Value
  //   'first': 'partridge',
  //   'second': 'turtledoves',
  //   'fifth': 'golden rings',
  // };

  var gifts = Map<String, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  var nobleGases = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  Set name ={
    "sanket", "omkar","sahil","Siddhant"

  };
  print(name);
  name.add("Maruti");
  print(name);
  name.remove("omkar");
  print(name);

  Map  data={};
  data.addEntries({"newEntries":"dsa"}.entries);

  print(data);



}
