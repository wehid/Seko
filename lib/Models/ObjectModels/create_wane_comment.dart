class CreateWaneComment {
  String uploadID;
  String userID;
  String replyID;
  String comments;

  CreateWaneComment({this.uploadID, this.userID, this.replyID, this.comments});

  CreateWaneComment.fromJson(Map<String, dynamic> json) {
    uploadID = json['UploadID'];
    userID = json['UserID'];
    replyID = json['ReplyID'];
    comments = json['Comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UploadID'] = this.uploadID;
    data['UserID'] = this.userID;
    data['ReplyID'] = this.replyID;
    data['Comments'] = this.comments;
    return data;
  }
}
