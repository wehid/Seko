class ItemComment {
  String id;
  String itemID;
  String userID;
  String replyID;
  String comments;
  String commentDate;
  String numLikes;
  String userName;
  String commentLikeID;
  String commentBookmarkID;
  String followingID;
  List<ItemComment> replies;

  ItemComment({
    this.id,
    this.itemID,
    this.userID,
    this.replyID,
    this.comments,
    this.commentDate,
    this.numLikes,
    this.userName,
    this.commentLikeID,
    this.commentBookmarkID,
    this.followingID,
    this.replies,
  });

  ItemComment.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    itemID = json['ItemID'];
    userID = json['UserID'];
    replyID = json['ReplyID'];
    comments = json['Comments'];
    commentDate = json['CommentDate'];
    numLikes = json['NumLikes'];
    userName = json['UserName'];
    commentLikeID = json['CommentLikeID'];
    commentBookmarkID = json['CommentBookmarkID'];
    followingID = json['FollowingID'];
    if (json['Replies'] != null) {
      replies = [];
      json['Replies'].forEach((v) {
        replies.add(ItemComment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['ItemID'] = this.itemID;
    data['UserID'] = this.userID;
    data['ReplyID'] = this.replyID;
    data['Comments'] = this.comments;
    data['CommentDate'] = this.commentDate;
    data['NumLikes'] = this.numLikes;
    data['UserName'] = this.userName;
    data['CommentLikeID'] = this.commentLikeID;
    data['CommentBookmarkID'] = this.commentBookmarkID;
    data['FollowingID'] = this.followingID;
    if (this.replies != null) {
      data['Replies'] = this.replies.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
