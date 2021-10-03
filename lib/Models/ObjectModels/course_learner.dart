class CourseLearner {
  String id;
  String courseId;
  String userId;
  String courseName;
  String userUsername;
  String userName;
  String userFamily;
  String userImage;
  String userImagePath;

  CourseLearner(
      {this.id,
        this.courseId,
        this.userId,
        this.courseName,
        this.userUsername,
        this.userName,
        this.userFamily,
        this.userImage,
        this.userImagePath});

  CourseLearner.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    courseId = json['CourseID'];
    userId = json['UserID'];
    courseName = json['CourseName'];
    userUsername = json['UserUsername'];
    userName = json['UserName'];
    userFamily = json['UserFamily'];
    userImage = json['UserImage'];
    userImagePath = json['UserImagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['CourseID'] = this.courseId;
    data['UserID'] = this.userId;
    data['CourseName'] = this.courseName;
    data['UserUsername'] = this.userUsername;
    data['UserName'] = this.userName;
    data['UserFamily'] = this.userFamily;
    data['UserImage'] = this.userImage;
    data['UserImagePath'] = this.userImagePath;
    return data;
  }
}
