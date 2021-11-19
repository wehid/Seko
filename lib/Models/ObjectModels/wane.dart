class Wane {
  String id;
  String uploadGroupId;
  String userId;
  String title;
  String introduction;
  String contents;
  String file;
  String videoUrl;
  String link;
  String image;
  String uploadDate;
  String state;
  String uploadGroupName;
  String userUsername;
  String userName;
  String userFamily;
  String userImage;
  String imagePath;
  String filePath;
  String userImagePath;

  Wane({
    this.id,
    this.uploadGroupId,
    this.userId,
    this.title,
    this.introduction,
    this.contents,
    this.file,
    this.videoUrl,
    this.link,
    this.image,
    this.uploadDate,
    this.state,
    this.uploadGroupName,
    this.userUsername,
    this.userName,
    this.userFamily,
    this.userImage,
    this.imagePath,
    this.filePath,
    this.userImagePath,
  });

  Wane.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    uploadGroupId = json['UploadGroupID'];
    userId = json['UserID'];
    title = json['Title'];
    introduction = json['Introduction'];
    contents = json['Contents'];
    file = json['File'];
    videoUrl = json['VideoUrl'];
    link = json['Link'];
    image = json['Image'];
    uploadDate = json['UploadDate'];
    state = json['State'];
    uploadGroupName = json['UploadGroupName'];
    userUsername = json['UserUsername'];
    userName = json['UserName'];
    userFamily = json['UserFamily'];
    userImage = json['UserImage'];
    imagePath = json['ImagePath'];
    filePath = json['FilePath'];
    userImagePath = json['UserImagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['UploadGroupID'] = this.uploadGroupId;
    data['UserID'] = this.userId;
    data['Title'] = this.title;
    data['Introduction'] = this.introduction;
    data['Contents'] = this.contents;
    data['File'] = this.file;
    data['VideoUrl'] = this.videoUrl;
    data['Link'] = this.link;
    data['Image'] = this.image;
    data['UploadDate'] = this.uploadDate;
    data['State'] = this.state;
    data['UploadGroupName'] = this.uploadGroupName;
    data['UserUsername'] = this.userUsername;
    data['UserName'] = this.userName;
    data['UserFamily'] = this.userFamily;
    data['UserImage'] = this.userImage;
    data['ImagePath'] = this.imagePath;
    data['FilePath'] = this.filePath;
    data['UserImagePath'] = this.userImagePath;
    return data;
  }
}
