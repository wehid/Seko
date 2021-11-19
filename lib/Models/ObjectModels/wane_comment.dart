class WaneComment {
  String iD;
  String uploadID;
  String userID;
  String replyID;
  String comments;
  String commentDate;
  String userUsername;
  String userName;
  String userFamily;
  String userImage;
  String userImagePath;

  WaneComment({
    this.iD,
    this.uploadID,
    this.userID,
    this.replyID,
    this.comments,
    this.commentDate,
    this.userUsername,
    this.userName,
    this.userFamily,
    this.userImage,
    this.userImagePath,
  });

  WaneComment.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    uploadID = json['UploadID'];
    userID = json['UserID'];
    replyID = json['ReplyID'];
    comments = json['Comments'];
    commentDate = json['CommentDate'];
    userUsername = json['UserUsername'];
    userName = json['UserName'];
    userFamily = json['UserFamily'];
    userImage = json['UserImage'];
    userImagePath = json['UserImagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['UploadID'] = this.uploadID;
    data['UserID'] = this.userID;
    data['ReplyID'] = this.replyID;
    data['Comments'] = this.comments;
    data['CommentDate'] = this.commentDate;
    data['UserUsername'] = this.userUsername;
    data['UserName'] = this.userName;
    data['UserFamily'] = this.userFamily;
    data['UserImage'] = this.userImage;
    data['UserImagePath'] = this.userImagePath;
    return data;
  }
}
