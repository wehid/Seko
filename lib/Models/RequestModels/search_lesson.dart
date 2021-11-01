class SearchLesson {
  String courseID;
  String weekID;
  String orderBy;
  String orderDir;
  int page;
  int rowsPerPage;

  SearchLesson({
    this.courseID,
    this.weekID,
    this.orderBy = "WeekID",
    this.orderDir = "asc",
    this.page,
    this.rowsPerPage,
  });

  SearchLesson.fromJson(Map<String, dynamic> json) {
    courseID = json['CourseID'];
    weekID = json['WeekID'];
    orderBy = json['OrderBy'];
    orderDir = json['OrderDir'];
    page = json['Page'];
    rowsPerPage = json['RowsPerPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CourseID'] = this.courseID;
    data['WeekID'] = this.weekID;
    data['OrderBy'] = this.orderBy;
    data['OrderDir'] = this.orderDir;
    data['Page'] = this.page;
    data['RowsPerPage'] = this.rowsPerPage;
    return data;
  }
}
