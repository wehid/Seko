class SearchSurveyQuestion {
  String itemId;
  String orderBy;
  String orderDir;
  int page;
  String rowsPerPage;

  SearchSurveyQuestion({
    this.itemId,
    this.orderBy = "SortIndex",
    this.orderDir = "asc",
    this.page = 1,
    this.rowsPerPage,
  });

  SearchSurveyQuestion.fromJson(Map<String, dynamic> json) {
    itemId = json['ItemID'];
    orderBy = json['OrderBy'];
    orderDir = json['OrderDir'];
    page = json['Page'];
    rowsPerPage = json['RowsPerPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ItemID'] = this.itemId;
    data['OrderBy'] = this.orderBy;
    data['OrderDir'] = this.orderDir;
    data['Page'] = this.page;
    data['RowsPerPage'] = this.rowsPerPage;
    return data;
  }
}
