class SearchForum {
  String forumID;
  String forumType;
  String title;
  String userID;
  String orderBy;
  String orderDir;
  int page;
  int rowsPerPage;

  SearchForum({
    this.forumID,
    this.forumType,
    this.title,
    this.userID,
    this.orderBy = "ID",
    this.orderDir = "asc",
    this.page,
    this.rowsPerPage,
  });

  SearchForum.fromJson(Map<String, dynamic> json) {
    forumID = json['ForumID'];
    forumType = json['ForumType'];
    title = json['Title'];
    userID = json['UserID'];
    orderBy = json['OrderBy'];
    orderDir = json['OrderDir'];
    page = json['Page'];
    rowsPerPage = json['RowsPerPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ForumID'] = this.forumID;
    data['ForumType'] = this.forumType;
    data['Title'] = this.title;
    data['UserID'] = this.userID;
    data['OrderBy'] = this.orderBy;
    data['OrderDir'] = this.orderDir;
    data['Page'] = this.page;
    data['RowsPerPage'] = this.rowsPerPage;
    return data;
  }
}
