class UserLog {
  String id;
  String logId;
  String userId;
  String seen;
  String userUsername;
  String userName;
  String userFamily;
  String userImage;
  String refTable;
  String courseId;
  String refTableId;
  String logDate;
  String logMode;
  Null changes;
  String message;
  String loggerId;
  String loggerUsername;
  String loggerName;
  String loggerFamily;
  String loggerImage;
  String userImagePath;
  String loggerImagePath;
  String link;

  UserLog({
    this.id,
    this.logId,
    this.userId,
    this.seen,
    this.userUsername,
    this.userName,
    this.userFamily,
    this.userImage,
    this.refTable,
    this.courseId,
    this.refTableId,
    this.logDate,
    this.logMode,
    this.changes,
    this.message,
    this.loggerId,
    this.loggerUsername,
    this.loggerName,
    this.loggerFamily,
    this.loggerImage,
    this.userImagePath,
    this.loggerImagePath,
    this.link,
  });

  UserLog.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    logId = json['LogID'];
    userId = json['UserID'];
    seen = json['Seen'];
    userUsername = json['UserUsername'];
    userName = json['UserName'];
    userFamily = json['UserFamily'];
    userImage = json['UserImage'];
    refTable = json['RefTable'];
    courseId = json['CourseID'];
    refTableId = json['RefTableID'];
    logDate = json['LogDate'];
    logMode = json['LogMode'];
    changes = json['Changes'];
    message = json['Message'];
    loggerId = json['LoggerID'];
    loggerUsername = json['LoggerUsername'];
    loggerName = json['LoggerName'];
    loggerFamily = json['LoggerFamily'];
    loggerImage = json['LoggerImage'];
    userImagePath = json['UserImagePath'];
    loggerImagePath = json['LoggerImagePath'];
    link = json['Link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['LogID'] = this.logId;
    data['UserID'] = this.userId;
    data['Seen'] = this.seen;
    data['UserUsername'] = this.userUsername;
    data['UserName'] = this.userName;
    data['UserFamily'] = this.userFamily;
    data['UserImage'] = this.userImage;
    data['RefTable'] = this.refTable;
    data['CourseID'] = this.courseId;
    data['RefTableID'] = this.refTableId;
    data['LogDate'] = this.logDate;
    data['LogMode'] = this.logMode;
    data['Changes'] = this.changes;
    data['Message'] = this.message;
    data['LoggerID'] = this.loggerId;
    data['LoggerUsername'] = this.loggerUsername;
    data['LoggerName'] = this.loggerName;
    data['LoggerFamily'] = this.loggerFamily;
    data['LoggerImage'] = this.loggerImage;
    data['UserImagePath'] = this.userImagePath;
    data['LoggerImagePath'] = this.loggerImagePath;
    data['Link'] = this.link;
    return data;
  }
}
