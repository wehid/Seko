class ForumPost {
  String iD;
  String forumID;
  String userID;
  String title;
  String contents;
  String videoUrl;
  String image;
  String entryDate;
  String forumName;
  String forumType;
  String userUsername;
  String userName;
  String userFamily;
  String userImage;
  String imagePath;
  String userImagePath;

  ForumPost({
    this.iD,
    this.forumID,
    this.userID,
    this.title,
    this.contents,
    this.videoUrl,
    this.image,
    this.entryDate,
    this.forumName,
    this.forumType,
    this.userUsername,
    this.userName,
    this.userFamily,
    this.userImage,
    this.imagePath,
    this.userImagePath,
  });

  ForumPost.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    forumID = json['ForumID'];
    userID = json['UserID'];
    title = json['Title'];
    contents = json['Contents'];
    videoUrl = json['VideoUrl'];
    image = json['Image'];
    entryDate = json['EntryDate'];
    forumName = json['ForumName'];
    forumType = json['ForumType'];
    userUsername = json['UserUsername'];
    userName = json['UserName'];
    userFamily = json['UserFamily'];
    userImage = json['UserImage'];
    imagePath = json['ImagePath'];
    userImagePath = json['UserImagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['ForumID'] = this.forumID;
    data['UserID'] = this.userID;
    data['Title'] = this.title;
    data['Contents'] = this.contents;
    data['VideoUrl'] = this.videoUrl;
    data['Image'] = this.image;
    data['EntryDate'] = this.entryDate;
    data['ForumName'] = this.forumName;
    data['ForumType'] = this.forumType;
    data['UserUsername'] = this.userUsername;
    data['UserName'] = this.userName;
    data['UserFamily'] = this.userFamily;
    data['UserImage'] = this.userImage;
    data['ImagePath'] = this.imagePath;
    data['UserImagePath'] = this.userImagePath;
    return data;
  }
}
