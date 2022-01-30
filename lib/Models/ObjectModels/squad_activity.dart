class SquadActivity {
  String id;
  String squadId;
  String userId;
  String activityDate;
  String activityType;
  String title;
  String message;
  String file;
  String location;
  String secondDate;
  String userUsername;
  String userName;
  String userFamily;
  String userImage;
  String filePath;
  String userImagePath;

  SquadActivity({
    this.id,
    this.squadId,
    this.userId,
    this.activityDate,
    this.activityType,
    this.title,
    this.message,
    this.file,
    this.location,
    this.secondDate,
    this.userUsername,
    this.userName,
    this.userFamily,
    this.userImage,
    this.filePath,
    this.userImagePath,
  });

  SquadActivity.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    squadId = json['SquadID'];
    userId = json['UserID'];
    activityDate = json['ActivityDate'];
    activityType = json['ActivityType'];
    title = json['Title'];
    message = json['Message'];
    file = json['File'];
    location = json['Location'];
    secondDate = json['SecondDate'];
    userUsername = json['UserUsername'];
    userName = json['UserName'];
    userFamily = json['UserFamily'];
    userImage = json['UserImage'];
    filePath = json['FilePath'];
    userImagePath = json['UserImagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['SquadID'] = this.squadId;
    data['UserID'] = this.userId;
    data['ActivityDate'] = this.activityDate;
    data['ActivityType'] = this.activityType;
    data['Title'] = this.title;
    data['Message'] = this.message;
    data['File'] = this.file;
    data['Location'] = this.location;
    data['SecondDate'] = this.secondDate;
    data['UserUsername'] = this.userUsername;
    data['UserName'] = this.userName;
    data['UserFamily'] = this.userFamily;
    data['UserImage'] = this.userImage;
    data['FilePath'] = this.filePath;
    data['UserImagePath'] = this.userImagePath;
    return data;
  }
}
