class Character {
  int? id;
  String? name;
  List<String>? images;


  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    images = List<String>.from(json['images']);
  }

}