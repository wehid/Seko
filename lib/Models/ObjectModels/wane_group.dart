class WaneGroup {
  String id;
  String title;
  String image;
  String imagePath;

  WaneGroup({this.id, this.title, this.image, this.imagePath});

  WaneGroup.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    title = json['Title'];
    image = json['Image'];
    imagePath = json['ImagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['Title'] = this.title;
    data['Image'] = this.image;
    data['ImagePath'] = this.imagePath;
    return data;
  }
}
