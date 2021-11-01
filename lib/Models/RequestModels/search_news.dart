class SearchNews {
  String title;
  String headlineGroupId;
  String userId;
  String status;
  String orderBy;
  String orderDir;
  int page;
  int rowsPerPage;

  SearchNews({
    this.title="",
    this.headlineGroupId="",
    this.userId="",
    this.status="",
    this.orderBy ="ID",
    this.orderDir="asc",
    this.page = 1,
    this.rowsPerPage,
  });

  SearchNews.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    headlineGroupId = json['HeadlineGroupID'];
    userId = json['UserID'];
    status = json['Status'];
    orderBy = json['OrderBy'];
    orderDir = json['OrderDir'];
    page = json['Page'];
    rowsPerPage = json['RowsPerPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['HeadlineGroupID'] = this.headlineGroupId;
    data['UserID'] = this.userId;
    data['Status'] = this.status;
    data['OrderBy'] = this.orderBy;
    data['OrderDir'] = this.orderDir;
    data['Page'] = this.page;
    data['RowsPerPage'] = this.rowsPerPage;
    return data;
  }
}
