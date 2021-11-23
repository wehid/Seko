class SearchBook {
  String name;
  String type;
  String userId;
  String orderBy;
  String orderDir;
  int page;
  int rowsPerPage;

  SearchBook({
    this.name,
    this.type,
    this.userId,
    this.orderBy = "ID",
    this.orderDir = "asc",
    this.page = 1,
    this.rowsPerPage,
  });

  SearchBook.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    type = json['Type'];
    userId = json['UserID'];
    orderBy = json['OrderBy'];
    orderDir = json['OrderDir'];
    page = json['Page'];
    rowsPerPage = json['RowsPerPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Type'] = this.type;
    data['UserID'] = this.userId;
    data['OrderBy'] = this.orderBy;
    data['OrderDir'] = this.orderDir;
    data['Page'] = this.page;
    data['RowsPerPage'] = this.rowsPerPage;
    return data;
  }
}
