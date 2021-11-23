class Item {
  String id;
  String lessonID;
  String title;
  String sortIndex;
  String video;
  String videoUrl;
  String picture;
  String contents;
  String type;
  //for allow comments, 1 means false, 2 means true
  String allowComments;
  String lessonName;
  String userItemID;
  String userItemStatus;
  String picturePath;
  String videoPath;

  Item({
    this.id,
    this.lessonID,
    this.title,
    this.sortIndex,
    this.video,
    this.videoUrl,
    this.picture,
    this.contents,
    this.type,
    this.allowComments,
    this.lessonName,
    this.userItemID,
    this.userItemStatus,
    this.picturePath,
    this.videoPath,
  });

  Item.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    lessonID = json['LessonID'];
    title = json['Title'];
    sortIndex = json['SortIndex'];
    video = json['Video'];
    videoUrl = json['VideoUrl'];
    picture = json['Picture'];
    contents = json['Contents'];
    type = json['Type'];
    allowComments = json['AllowComments'];
    lessonName = json['LessonName'];
    userItemID = json['UserItemID'];
    userItemStatus = json['UserItemStatus'];
    picturePath = json['PicturePath'];
    videoPath = json['VideoPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['LessonID'] = this.lessonID;
    data['Title'] = this.title;
    data['SortIndex'] = this.sortIndex;
    data['Video'] = this.video;
    data['VideoUrl'] = this.videoUrl;
    data['Picture'] = this.picture;
    data['Contents'] = this.contents;
    data['Type'] = this.type;
    data['AllowComments'] = this.allowComments;
    data['LessonName'] = this.lessonName;
    data['UserItemID'] = this.userItemID;
    data['UserItemStatus'] = this.userItemStatus;
    data['PicturePath'] = this.picturePath;
    data['VideoPath'] = this.videoPath;
    return data;
  }
}
