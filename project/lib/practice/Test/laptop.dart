void main() {
  List<Laptop> data = [];
  data.add(Laptop("Sanket", 2, 2));
}

class Laptop {
  int? id;
  String? name;
  int? ram;

  Laptop(this.name, this.id, this.ram) {

    print("$name , $id , $ram");
  }
}
