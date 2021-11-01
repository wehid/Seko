class SearchItemComments {
  String itemId;
  //UserID is the user who posted the comment
  String userId;
  //ReplyID means just comment that are reply to comment with ID=ReplyID
  String replyId;
  // RootComments is used to exclude the replies. 1 means just root comments, 0 means all comments
  String rootComments;
  // Bookmarked = 1 means return just comments bookmarked by me (CurUserID), 0 means all comments
  String bookmarked;
  //Followed = 1 means return just comments from those that I (CurUserID) follow, 0 means all comments
  String followed;
  // Team means return just comments from users in my Team (CurUserID), 0 means all comments
  String team;
  //Liked = 1 means return just comments that I (CurUserID) have liked, 0 means all comments
  String liked;
  //CurUserID is the logged-in user
  String curUserId;
  // Replies is used to include replies of root comments in the result. You can set it to 1 to get all comments including their replies in one call.
  String replies;
  String orderBy;
  String orderDir;
  int page;
  int rowsPerPage;


  SearchItemComments({
    this.itemId,
    this.userId,
    this.replyId,
    this.rootComments = "0",
    this.bookmarked = "0",
    this.followed = "0",
    this.team = "0",
    this.liked = "0",
    this.curUserId,
    this.replies = "1",
    this.orderBy = "ID",
    this.orderDir = "desc",
    this.page = 1,
    this.rowsPerPage,
  });

  SearchItemComments.fromJson(Map<String, dynamic> json) {
    itemId = json['ItemID'];
    userId = json['UserID'];
    replyId = json['ReplyID'];
    rootComments = json['RootComments'];
    bookmarked = json['Bookmarked'];
    followed = json['Followed'];
    team = json['Team'];
    liked = json['Liked'];
    curUserId = json['CurUserID'];
    replies = json['Replies'];
    orderBy = json['OrderBy'];
    orderDir = json['OrderDir'];
    page = json['Page'];
    rowsPerPage = json['RowsPerPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ItemID'] = this.itemId;
    data['UserID'] = this.userId;
    data['ReplyID'] = this.replyId;
    data['RootComments'] = this.rootComments;
    data['Bookmarked'] = this.bookmarked;
    data['Followed'] = this.followed;
    data['Team'] = this.team;
    data['Liked'] = this.liked;
    data['CurUserID'] = this.curUserId;
    data['Replies'] = this.replies;
    data['OrderBy'] = this.orderBy;
    data['OrderDir'] = this.orderDir;
    data['Page'] = this.page;
    data['RowsPerPage'] = this.rowsPerPage;
    return data;
  }
}
