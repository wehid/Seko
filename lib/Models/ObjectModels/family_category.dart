class FamilyCategory {
  String id;
  String title;
  String brief;
  String smallImage;
  String backColor;
  String foreColor;
  String secondBackColor;
  String secondForeColor;
  String introduction;
  String contents;
  String smallImagePath;

  FamilyCategory(
      {this.id,
      this.title,
      this.brief,
      this.smallImage,
      this.backColor,
      this.foreColor,
      this.secondBackColor,
      this.secondForeColor,
      this.introduction,
      this.contents,
      this.smallImagePath});

  FamilyCategory.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    title = json['Title'];
    brief = json['Brief'];
    smallImage = json['SmallImage'];
    backColor = json['BackColor'];
    foreColor = json['ForeColor'];
    secondBackColor = json['SecondBackColor'];
    secondForeColor = json['SecondForeColor'];
    introduction = json['Introduction'];
    contents = json['Contents'];
    smallImagePath = json['SmallImagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['Title'] = this.title;
    data['Brief'] = this.brief;
    data['SmallImage'] = this.smallImage;
    data['BackColor'] = this.backColor;
    data['ForeColor'] = this.foreColor;
    data['SecondBackColor'] = this.secondBackColor;
    data['SecondForeColor'] = this.secondForeColor;
    data['Introduction'] = this.introduction;
    data['Contents'] = this.contents;
    data['SmallImagePath'] = this.smallImagePath;
    return data;
  }
}
