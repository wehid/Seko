class SearchFamilyItem {
  String title;
  String familyCatId;
  String userId;
  String orderBy;
  String orderDir;
  int page;
  int rowsPerPage;

  SearchFamilyItem({
    this.title,
    this.familyCatId,
    this.userId,
    this.orderBy = "ID",
    this.orderDir = "asc",
    this.page,
    this.rowsPerPage,
  });

  SearchFamilyItem.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    familyCatId = json['FamilyCatID'];
    userId = json['UserID'];
    orderBy = json['OrderBy'];
    orderDir = json['OrderDir'];
    page = json['Page'];
    rowsPerPage = json['RowsPerPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['FamilyCatID'] = this.familyCatId;
    data['UserID'] = this.userId;
    data['OrderBy'] = this.orderBy;
    data['OrderDir'] = this.orderDir;
    data['Page'] = this.page;
    data['RowsPerPage'] = this.rowsPerPage;
    return data;
  }
}
