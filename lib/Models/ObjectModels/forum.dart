class Forum {
  String id;
  String title;
  String image;
  String type;
  String imagePath;

  Forum({this.id, this.title, this.image, this.type, this.imagePath});

  Forum.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    title = json['Title'];
    image = json['Image'];
    type = json['Type'];
    imagePath = json['ImagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['Title'] = this.title;
    data['Image'] = this.image;
    data['Type'] = this.type;
    data['ImagePath'] = this.imagePath;
    return data;
  }
}
