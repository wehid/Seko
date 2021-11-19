class ForumComment {
  String iD;
  String forumEntryID;
  String userID;
  String contents;
  String replyDate;
  String userUsername;
  String userName;
  String userFamily;
  String userImage;
  String userImagePath;

  ForumComment({
    this.iD,
    this.forumEntryID,
    this.userID,
    this.contents,
    this.replyDate,
    this.userUsername,
    this.userName,
    this.userFamily,
    this.userImage,
    this.userImagePath,
  });

  ForumComment.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    forumEntryID = json['ForumEntryID'];
    userID = json['UserID'];
    contents = json['Contents'];
    replyDate = json['ReplyDate'];
    userUsername = json['UserUsername'];
    userName = json['UserName'];
    userFamily = json['UserFamily'];
    userImage = json['UserImage'];
    userImagePath = json['UserImagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['ForumEntryID'] = this.forumEntryID;
    data['UserID'] = this.userID;
    data['Contents'] = this.contents;
    data['ReplyDate'] = this.replyDate;
    data['UserUsername'] = this.userUsername;
    data['UserName'] = this.userName;
    data['UserFamily'] = this.userFamily;
    data['UserImage'] = this.userImage;
    data['UserImagePath'] = this.userImagePath;
    return data;
  }
}
