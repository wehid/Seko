class SearchWeekByCourse {
  String courseID;
  String orderBy;
  String orderDir;
  int page;
  int rowsPerPage;

  SearchWeekByCourse({
    this.courseID,
    this.orderBy = "WeekNr",
    this.orderDir = "asc",
    this.page,
    this.rowsPerPage,
  });

  SearchWeekByCourse.fromJson(Map<String, dynamic> json) {
    courseID = json['CourseID'];
    orderBy = json['OrderBy'];
    orderDir = json['OrderDir'];
    page = json['Page'];
    rowsPerPage = json['RowsPerPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CourseID'] = this.courseID;
    data['OrderBy'] = this.orderBy;
    data['OrderDir'] = this.orderDir;
    data['Page'] = this.page;
    data['RowsPerPage'] = this.rowsPerPage;
    return data;
  }
}
