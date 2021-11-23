class FamilyItem {
  String id;
  String familyCatId;
  String userId;
  String title;
  String smallImage;
  String brief;
  String contents;
  String file;
  String link;
  String createDate;
  String type;
  String familyCatName;
  String userUsername;
  String userName;
  String userFamily;
  String userImage;
  String smallImagePath;
  String filePath;
  String userImagePath;

  FamilyItem({
    this.id,
    this.familyCatId,
    this.userId,
    this.title,
    this.smallImage,
    this.brief,
    this.contents,
    this.file,
    this.link,
    this.createDate,
    this.type,
    this.familyCatName,
    this.userUsername,
    this.userName,
    this.userFamily,
    this.userImage,
    this.smallImagePath,
    this.filePath,
    this.userImagePath,
  });

  FamilyItem.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    familyCatId = json['FamilyCatID'];
    userId = json['UserID'];
    title = json['Title'];
    smallImage = json['SmallImage'];
    brief = json['Brief'];
    contents = json['Contents'];
    file = json['File'];
    link = json['Link'];
    createDate = json['CreateDate'];
    type = json['Type'];
    familyCatName = json['FamilyCatName'];
    userUsername = json['UserUsername'];
    userName = json['UserName'];
    userFamily = json['UserFamily'];
    userImage = json['UserImage'];
    smallImagePath = json['SmallImagePath'];
    filePath = json['FilePath'];
    userImagePath = json['UserImagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['FamilyCatID'] = this.familyCatId;
    data['UserID'] = this.userId;
    data['Title'] = this.title;
    data['SmallImage'] = this.smallImage;
    data['Brief'] = this.brief;
    data['Contents'] = this.contents;
    data['File'] = this.file;
    data['Link'] = this.link;
    data['CreateDate'] = this.createDate;
    data['Type'] = this.type;
    data['FamilyCatName'] = this.familyCatName;
    data['UserUsername'] = this.userUsername;
    data['UserName'] = this.userName;
    data['UserFamily'] = this.userFamily;
    data['UserImage'] = this.userImage;
    data['SmallImagePath'] = this.smallImagePath;
    data['FilePath'] = this.filePath;
    data['UserImagePath'] = this.userImagePath;
    return data;
  }
}
