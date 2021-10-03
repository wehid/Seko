class UserItem {
  String id;
  String itemId;
  String courseLearnerId;
  String status;
  String doneDate;
  String courseName;
  String userId;
  String userName;
  String lessonId;
  String lessonName;
  String weekId;
  String weekNr;
  String weekTitle;

  UserItem({
    this.id,
    this.itemId,
    this.courseLearnerId,
    this.status,
    this.doneDate,
    this.courseName,
    this.userId,
    this.userName,
    this.lessonId,
    this.lessonName,
    this.weekId,
    this.weekNr,
    this.weekTitle,
  });

  UserItem.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    itemId = json['ItemID'];
    courseLearnerId = json['CourseLearnerID'];
    status = json['Status'];
    doneDate = json['DoneDate'];
    courseName = json['CourseName'];
    userId = json['UserID'];
    userName = json['UserName'];
    lessonId = json['LessonID'];
    lessonName = json['LessonName'];
    weekId = json['WeekID'];
    weekNr = json['WeekNr'];
    weekTitle = json['WeekTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['ItemID'] = this.itemId;
    data['CourseLearnerID'] = this.courseLearnerId;
    data['Status'] = this.status;
    data['DoneDate'] = this.doneDate;
    data['CourseName'] = this.courseName;
    data['UserID'] = this.userId;
    data['UserName'] = this.userName;
    data['LessonID'] = this.lessonId;
    data['LessonName'] = this.lessonName;
    data['WeekID'] = this.weekId;
    data['WeekNr'] = this.weekNr;
    data['WeekTitle'] = this.weekTitle;
    return data;
  }
}
