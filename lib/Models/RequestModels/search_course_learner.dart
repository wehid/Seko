class SearchCourseLearner {
  String courseId;
  String userId;
  String excludeTeamId;
  String orderBy;
  String orderDir;
  int page;
  int rowsPerPage;

  SearchCourseLearner({
    this.courseId,
    this.userId,
    this.excludeTeamId,
    this.orderBy = "CourseID",
    this.orderDir = "asc",
    this.page,
    this.rowsPerPage,
  });

  SearchCourseLearner.fromJson(Map<String, dynamic> json) {
    courseId = json['CourseID'];
    userId = json['UserID'];
    excludeTeamId = json['ExcludeTeamID'];
    orderBy = json['OrderBy'];
    orderDir = json['OrderDir'];
    page = json['Page'];
    rowsPerPage = json['RowsPerPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CourseID'] = this.courseId;
    data['UserID'] = this.userId;
    data['ExcludeTeamID'] = this.excludeTeamId;
    data['OrderBy'] = this.orderBy;
    data['OrderDir'] = this.orderDir;
    data['Page'] = this.page;
    data['RowsPerPage'] = this.rowsPerPage;
    return data;
  }
}
