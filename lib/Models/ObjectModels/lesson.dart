import 'item.dart';

class Lesson {
  String id;
  String weekID;
  String title;
  String sortIndex;
  String brief;
  String picture;
  String courseName;
  String weekName;
  String picturePath;
  bool isExpanded;
  List<Item> items;

  Lesson({
    this.id,
    this.weekID,
    this.title,
    this.sortIndex,
    this.brief,
    this.picture,
    this.courseName,
    this.weekName,
    this.picturePath,
    this.isExpanded = false,
    this.items,
  });

  Lesson.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    weekID = json['WeekID'];
    title = json['Title'];
    sortIndex = json['SortIndex'];
    brief = json['Brief'];
    picture = json['Picture'];
    courseName = json['CourseName'];
    weekName = json['WeekName'];
    picturePath = json['PicturePath'];
    isExpanded = false;
    items = [];
    // if (json['Items'] != null) {
    //   items = new List<Item>();
    //   json['Items'].forEach((v) {
    //     items.add(new Item.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['WeekID'] = this.weekID;
    data['Title'] = this.title;
    data['SortIndex'] = this.sortIndex;
    data['Brief'] = this.brief;
    data['Picture'] = this.picture;
    data['CourseName'] = this.courseName;
    data['WeekName'] = this.weekName;
    data['PicturePath'] = this.picturePath;
    if (this.items != null) {
      data['Items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
