class ItemComment {
  String id;
  String itemId;
  String userId;
  String replyId;
  String comments;
  String commentDate;
  String numLikes;
  String userName;
  String commentLikeId;
  String commentBookmarkId;
  String followingId;
  List<ItemComment> replies;

  ItemComment({
    this.id,
    this.itemId,
    this.userId,
    this.replyId,
    this.comments,
    this.commentDate,
    this.numLikes,
    this.userName,
    this.commentLikeId,
    this.commentBookmarkId,
    this.followingId,
    this.replies,
  });

  ItemComment.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    itemId = json['ItemID'];
    userId = json['UserID'];
    replyId = json['ReplyID'];
    comments = json['Comments'];
    commentDate = json['CommentDate'];
    numLikes = json['NumLikes'];
    userName = json['UserName'];
    commentLikeId = json['CommentLikeID'];
    commentBookmarkId = json['CommentBookmarkID'];
    followingId = json['FollowingID'];
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
    data['ItemID'] = this.itemId;
    data['UserID'] = this.userId;
    data['ReplyID'] = this.replyId;
    data['Comments'] = this.comments;
    data['CommentDate'] = this.commentDate;
    data['NumLikes'] = this.numLikes;
    data['UserName'] = this.userName;
    data['CommentLikeID'] = this.commentLikeId;
    data['CommentBookmarkID'] = this.commentBookmarkId;
    data['FollowingID'] = this.followingId;
    if (this.replies != null) {
      data['Replies'] = this.replies.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
