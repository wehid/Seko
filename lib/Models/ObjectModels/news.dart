class News {
  String id;
  String headlineGroupId;
  String userId;
  String title;
  String introduction;
  String contents;
  String link;
  String image;
  String createDate;
  String status;
  String headlineGroupName;
  String userUsername;
  String userName;
  String userFamily;
  String userImage;
  String imagePath;
  String userImagePath;

  News({
    this.id,
    this.headlineGroupId,
    this.userId,
    this.title,
    this.introduction,
    this.contents,
    this.link,
    this.image,
    this.createDate,
    this.status,
    this.headlineGroupName,
    this.userUsername,
    this.userName,
    this.userFamily,
    this.userImage,
    this.imagePath,
    this.userImagePath,
  });

  News.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    headlineGroupId = json['HeadlineGroupID'];
    userId = json['UserID'];
    title = json['Title'];
    introduction = json['Introduction'];
    contents = json['Contents'];
    link = json['Link'];
    image = json['Image'];
    createDate = json['CreateDate'];
    status = json['Status'];
    headlineGroupName = json['HeadlineGroupName'];
    userUsername = json['UserUsername'];
    userName = json['UserName'];
    userFamily = json['UserFamily'];
    userImage = json['UserImage'];
    imagePath = json['ImagePath'];
    userImagePath = json['UserImagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['HeadlineGroupID'] = this.headlineGroupId;
    data['UserID'] = this.userId;
    data['Title'] = this.title;
    data['Introduction'] = this.introduction;
    data['Contents'] = this.contents;
    data['Link'] = this.link;
    data['Image'] = this.image;
    data['CreateDate'] = this.createDate;
    data['Status'] = this.status;
    data['HeadlineGroupName'] = this.headlineGroupName;
    data['UserUsername'] = this.userUsername;
    data['UserName'] = this.userName;
    data['UserFamily'] = this.userFamily;
    data['UserImage'] = this.userImage;
    data['ImagePath'] = this.imagePath;
    data['UserImagePath'] = this.userImagePath;
    return data;
  }
}
