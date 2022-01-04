class SearchLesson {
  String courseID;
  String weekID;
  String appendItems;
  String orderBy;
  String orderDir;
  int page;
  int rowsPerPage;

  SearchLesson({
    this.courseID,
    this.weekID,
    this.appendItems = "1",
    this.orderBy = "SortIndex",
    this.orderDir = "asc",
    this.page,
    this.rowsPerPage,
  });

  SearchLesson.fromJson(Map<String, dynamic> json) {
    courseID = json['CourseID'];
    weekID = json['WeekID'];
    appendItems = json['AppendItems'];
    orderBy = json['OrderBy'];
    orderDir = json['OrderDir'];
    page = json['Page'];
    rowsPerPage = json['RowsPerPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CourseID'] = this.courseID;
    data['WeekID'] = this.weekID;
    data['AppendItems'] = this.appendItems;
    data['OrderBy'] = this.orderBy;
    data['OrderDir'] = this.orderDir;
    data['Page'] = this.page;
    data['RowsPerPage'] = this.rowsPerPage;
    return data;
  }
}
