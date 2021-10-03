class SearchBankiWane {
  String title;
  String uploadGroupId;
  String userId;
  String state;
  String orderBy;
  String orderDir;
  int page;
  int rowsPerPage;

  SearchBankiWane({
    this.title = "",
    this.uploadGroupId = "",
    this.userId = "",
    this.state ="",
    this.orderBy = "ID",
    this.orderDir = "asc",
    this.page = 1,
    this.rowsPerPage,
  });

  SearchBankiWane.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    uploadGroupId = json['UploadGroupID'];
    userId = json['UserID'];
    state = json['State'];
    orderBy = json['OrderBy'];
    orderDir = json['OrderDir'];
    page = json['Page'];
    rowsPerPage = json['RowsPerPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['UploadGroupID'] = this.uploadGroupId;
    data['UserID'] = this.userId;
    data['State'] = this.state;
    data['OrderBy'] = this.orderBy;
    data['OrderDir'] = this.orderDir;
    data['Page'] = this.page;
    data['RowsPerPage'] = this.rowsPerPage;
    return data;
  }
}
