class SearchItem {
  String lessonID;
  String type;
  String sortIndex;
  String fromSortIndex;
  String toSortIndex;
  String orderBy;
  String orderDir;
  int page;
  int rowsPerPage;

  SearchItem({
    this.lessonID,
    this.type,
    this.sortIndex,
    this.fromSortIndex,
    this.toSortIndex,
    this.orderBy = "SortIndex",
    this.orderDir = "asc",
    this.page,
    this.rowsPerPage,
  });

  SearchItem.fromJson(Map<String, dynamic> json) {
    lessonID = json['LessonID'];
    type = json['Type'];
    sortIndex = json['SortIndex'];
    fromSortIndex = json['FromSortIndex'];
    toSortIndex = json['ToSortIndex'];
    orderBy = json['OrderBy'];
    orderDir = json['OrderDir'];
    page = json['Page'];
    rowsPerPage = json['RowsPerPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LessonID'] = this.lessonID;
    data['Type'] = this.type;
    data['SortIndex'] = this.sortIndex;
    data['FromSortIndex'] = this.fromSortIndex;
    data['ToSortIndex'] = this.toSortIndex;
    data['OrderBy'] = this.orderBy;
    data['OrderDir'] = this.orderDir;
    data['Page'] = this.page;
    data['RowsPerPage'] = this.rowsPerPage;
    return data;
  }
}
