class SearchWaneComment {
  String uploadID;
  String comments;
  String userID;
  String replyID;
  String rootComments;
  String replies;
  String orderBy;
  String orderDir;
  int page;
  int rowsPerPage;

  SearchWaneComment({
    this.uploadID,
    this.comments,
    this.userID,
    this.replyID,
    this.rootComments,
    this.replies,
    this.orderBy = "ID",
    this.orderDir = "desc",
    this.page,
    this.rowsPerPage,
  });

  SearchWaneComment.fromJson(Map<String, dynamic> json) {
    uploadID = json['UploadID'];
    comments = json['Comments'];
    userID = json['UserID'];
    replyID = json['ReplyID'];
    rootComments = json['RootComments'];
    replies = json['Replies'];
    orderBy = json['OrderBy'];
    orderDir = json['OrderDir'];
    page = json['Page'];
    rowsPerPage = json['RowsPerPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UploadID'] = this.uploadID;
    data['Comments'] = this.comments;
    data['UserID'] = this.userID;
    data['ReplyID'] = this.replyID;
    data['RootComments'] = this.rootComments;
    data['Replies'] = this.replies;
    data['OrderBy'] = this.orderBy;
    data['OrderDir'] = this.orderDir;
    data['Page'] = this.page;
    data['RowsPerPage'] = this.rowsPerPage;
    return data;
  }
}
