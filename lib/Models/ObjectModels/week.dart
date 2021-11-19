class Week {
  String id;
  String courseID;
  String weekNr;
  String title;
  String courseName;
  String numLessons;

  Week({
    this.id,
    this.courseID,
    this.weekNr,
    this.title,
    this.courseName,
    this.numLessons,
  });

  Week.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    courseID = json['CourseID'];
    weekNr = json['WeekNr'];
    title = json['Title'];
    courseName = json['CourseName'];
    numLessons = json['NumLessons'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['CourseID'] = this.courseID;
    data['WeekNr'] = this.weekNr;
    data['Title'] = this.title;
    data['CourseName'] = this.courseName;
    data['NumLessons'] = this.numLessons;
    return data;
  }
}
