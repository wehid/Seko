class Category {
  String id;
  String title;
  String brief;
  String overview;
  String smallImage;

  Category({this.id, this.title, this.brief, this.overview, this.smallImage});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    title = json['Title'];
    brief = json['Brief'];
    overview = json['Overview'];
    smallImage = json['SmallImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['Title'] = this.title;
    data['Brief'] = this.brief;
    data['Overview'] = this.overview;
    data['SmallImage'] = this.smallImage;
    return data;
  }

  // // get all category from api and return them.
  // Future<List<Category>> getAllCategory() async {
  //   List<Category> myCategories = [];
  //   try {
  //     String categoryListString = await Api().getAllCategory();
  //     Iterable iterable = json.decode(categoryListString);
  //     myCategories = iterable.map((item) => Category.fromJson(item)).toList();
  //   } catch (error) {
  //     throw error;
  //   }
  //   return myCategories;
  // }
}
