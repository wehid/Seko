class CreateComment {
  String itemId;
  String userId;
  int replyId;
  String comments;

  CreateComment({this.itemId, this.userId, this.replyId, this.comments});

  CreateComment.fromJson(Map<String, dynamic> json) {
    itemId = json['ItemID'];
    userId = json['UserID'];
    replyId = json['ReplyID'];
    comments = json['Comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ItemID'] = this.itemId;
    data['UserID'] = this.userId;
    data['ReplyID'] = this.replyId;
    data['Comments'] = this.comments;
    return data;
  }
}
