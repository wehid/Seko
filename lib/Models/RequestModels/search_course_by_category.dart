class SearchCourseByCategory {
  String categoryID;
  String partnerID;
  String name;
  String brief;
  String fromStartDate;
  String toStartDate;
  String orderBy;
  String orderDir;
  int page;
  int rowsPerPage;

  SearchCourseByCategory({
    this.categoryID,
    this.partnerID,
    this.name,
    this.brief,
    this.fromStartDate,
    this.toStartDate,
    this.orderBy = 'Name',
    this.orderDir = 'asc',
    this.page = 1,
    this.rowsPerPage = 2,
  });

  SearchCourseByCategory.fromJson(Map<String, dynamic> json) {
    categoryID = json['CategoryID'];
    partnerID = json['PartnerID'];
    name = json['Name'];
    brief = json['Brief'];
    fromStartDate = json['FromStartDate'];
    toStartDate = json['ToStartDate'];
    orderBy = json['OrderBy'];
    orderDir = json['OrderDir'];
    page = json['Page'];
    rowsPerPage = json['RowsPerPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CategoryID'] = this.categoryID;
    data['PartnerID'] = this.partnerID;
    data['Name'] = this.name;
    data['Brief'] = this.brief;
    data['FromStartDate'] = this.fromStartDate;
    data['ToStartDate'] = this.toStartDate;
    data['OrderBy'] = this.orderBy;
    data['OrderDir'] = this.orderDir;
    data['Page'] = this.page;
    data['RowsPerPage'] = this.rowsPerPage;
    return data;
  }
}
