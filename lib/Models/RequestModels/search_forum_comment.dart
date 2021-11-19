class SearchForumComment {
  String forumEntryID;
  String userID;
  String contents;
  String orderBy;
  String orderDir;
  int page;
  int rowsPerPage;

  SearchForumComment({
    this.forumEntryID,
    this.userID,
    this.contents,
    this.orderBy = "ID",
    this.orderDir = "desc",
    this.page,
    this.rowsPerPage,
  });

  SearchForumComment.fromJson(Map<String, dynamic> json) {
    forumEntryID = json['ForumEntryID'];
    userID = json['UserID'];
    contents = json['Contents'];
    orderBy = json['OrderBy'];
    orderDir = json['OrderDir'];
    page = json['Page'];
    rowsPerPage = json['RowsPerPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ForumEntryID'] = this.forumEntryID;
    data['UserID'] = this.userID;
    data['Contents'] = this.contents;
    data['OrderBy'] = this.orderBy;
    data['OrderDir'] = this.orderDir;
    data['Page'] = this.page;
    data['RowsPerPage'] = this.rowsPerPage;
    return data;
  }
}
