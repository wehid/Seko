class Item {
  String id;
  String lessonId;
  String title;
  String sortIndex;
  String video;
  String videoUrl;
  String picture;
  String contents;
  String type;
  //for allow comments, 1 means false, 2 means true
  String allowComments;
  String allowFiles;
  String lessonName;
  String weekId;
  String userItemId;
  String userItemStatus;
  String userItemDoneDate;
  String picturePath;
  String videoPath;

  Item({
    this.id,
    this.lessonId,
    this.title,
    this.sortIndex,
    this.video,
    this.videoUrl,
    this.picture,
    this.contents,
    this.type,
    this.allowComments,
    this.allowFiles,
    this.lessonName,
    this.weekId,
    this.userItemId,
    this.userItemStatus,
    this.userItemDoneDate,
    this.picturePath,
    this.videoPath,
  });

  Item.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    lessonId = json['LessonID'];
    title = json['Title'];
    sortIndex = json['SortIndex'];
    video = json['Video'];
    videoUrl = json['VideoUrl'];
    picture = json['Picture'];
    contents = json['Contents'];
    type = json['Type'];
    allowComments = json['AllowComments'];
    allowFiles = json['AllowFiles'];
    lessonName = json['LessonName'];
    weekId = json['WeekID'];
    userItemId = json['UserItemID'];
    userItemStatus = json['UserItemStatus'];
    userItemDoneDate = json['UserItemDoneDate'];
    picturePath = json['PicturePath'];
    videoPath = json['VideoPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['LessonID'] = this.lessonId;
    data['Title'] = this.title;
    data['SortIndex'] = this.sortIndex;
    data['Video'] = this.video;
    data['VideoUrl'] = this.videoUrl;
    data['Picture'] = this.picture;
    data['Contents'] = this.contents;
    data['Type'] = this.type;
    data['AllowComments'] = this.allowComments;
    data['AllowFiles'] = this.allowFiles;
    data['LessonName'] = this.lessonName;
    data['WeekID'] = this.weekId;
    data['UserItemID'] = this.userItemId;
    data['UserItemStatus'] = this.userItemStatus;
    data['UserItemDoneDate'] = this.userItemDoneDate;
    data['PicturePath'] = this.picturePath;
    data['VideoPath'] = this.videoPath;
    return data;
  }
}
