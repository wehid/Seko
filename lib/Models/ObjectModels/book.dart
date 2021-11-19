class Book {
  String id;
  String type;
  String userId;
  String name;
  String smallImage;
  String brief;
  String file;
  String link;
  String createDate;
  String textFile;
  String userUsername;
  String userName;
  String userFamily;
  String userImage;
  String filePath;
  String smallImagePath;
  String userImagePath;

  Book({
    this.id,
    this.type,
    this.userId,
    this.name,
    this.smallImage,
    this.brief,
    this.file,
    this.link,
    this.createDate,
    this.textFile,
    this.userUsername,
    this.userName,
    this.userFamily,
    this.userImage,
    this.filePath,
    this.smallImagePath,
    this.userImagePath,
  });

  Book.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    type = json['Type'];
    userId = json['UserID'];
    name = json['Name'];
    smallImage = json['SmallImage'];
    brief = json['Brief'];
    file = json['File'];
    link = json['Link'];
    createDate = json['CreateDate'];
    textFile = json['TextFile'];
    userUsername = json['UserUsername'];
    userName = json['UserName'];
    userFamily = json['UserFamily'];
    userImage = json['UserImage'];
    filePath = json['FilePath'];
    smallImagePath = json['SmallImagePath'];
    userImagePath = json['UserImagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['Type'] = this.type;
    data['UserID'] = this.userId;
    data['Name'] = this.name;
    data['SmallImage'] = this.smallImage;
    data['Brief'] = this.brief;
    data['File'] = this.file;
    data['Link'] = this.link;
    data['CreateDate'] = this.createDate;
    data['TextFile'] = this.textFile;
    data['UserUsername'] = this.userUsername;
    data['UserName'] = this.userName;
    data['UserFamily'] = this.userFamily;
    data['UserImage'] = this.userImage;
    data['FilePath'] = this.filePath;
    data['SmallImagePath'] = this.smallImagePath;
    data['UserImagePath'] = this.userImagePath;
    return data;
  }
}
