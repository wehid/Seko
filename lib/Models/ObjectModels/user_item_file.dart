class UserItemFile {
  String id;
  String userItemId;
  String file;
  String learnerComments;
  String sendDate;
  String supervisorId;
  String supervisorComments;
  String replyDate;
  String status;
  String itemId;
  String itemName;
  String courseId;
  String courseName;
  String courseSmallImage;
  String coursePartnerId;
  String learnerId;
  String learnerUsername;
  String learnerName;
  String learnerFamily;
  String learnerImage;
  String supervisorUsername;
  String supervisorName;
  String supervisorFamily;
  String supervisorImage;
  String filePath;
  String learnerImagePath;
  String supervisorImagePath;

  UserItemFile({
    this.id,
    this.userItemId,
    this.file,
    this.learnerComments,
    this.sendDate,
    this.supervisorId,
    this.supervisorComments,
    this.replyDate,
    this.status,
    this.itemId,
    this.itemName,
    this.courseId,
    this.courseName,
    this.courseSmallImage,
    this.coursePartnerId,
    this.learnerId,
    this.learnerUsername,
    this.learnerName,
    this.learnerFamily,
    this.learnerImage,
    this.supervisorUsername,
    this.supervisorName,
    this.supervisorFamily,
    this.supervisorImage,
    this.filePath,
    this.learnerImagePath,
    this.supervisorImagePath,
  });

  UserItemFile.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    userItemId = json['UserItemID'];
    file = json['File'];
    learnerComments = json['LearnerComments'];
    sendDate = json['SendDate'];
    supervisorId = json['SupervisorID'];
    supervisorComments = json['SupervisorComments'];
    replyDate = json['ReplyDate'];
    status = json['Status'];
    itemId = json['ItemID'];
    itemName = json['ItemName'];
    courseId = json['CourseID'];
    courseName = json['CourseName'];
    courseSmallImage = json['CourseSmallImage'];
    coursePartnerId = json['CoursePartnerID'];
    learnerId = json['LearnerID'];
    learnerUsername = json['LearnerUsername'];
    learnerName = json['LearnerName'];
    learnerFamily = json['LearnerFamily'];
    learnerImage = json['LearnerImage'];
    supervisorUsername = json['SupervisorUsername'];
    supervisorName = json['SupervisorName'];
    supervisorFamily = json['SupervisorFamily'];
    supervisorImage = json['SupervisorImage'];
    filePath = json['FilePath'];
    learnerImagePath = json['LearnerImagePath'];
    supervisorImagePath = json['SupervisorImagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['UserItemID'] = this.userItemId;
    data['File'] = this.file;
    data['LearnerComments'] = this.learnerComments;
    data['SendDate'] = this.sendDate;
    data['SupervisorID'] = this.supervisorId;
    data['SupervisorComments'] = this.supervisorComments;
    data['ReplyDate'] = this.replyDate;
    data['Status'] = this.status;
    data['ItemID'] = this.itemId;
    data['ItemName'] = this.itemName;
    data['CourseID'] = this.courseId;
    data['CourseName'] = this.courseName;
    data['CourseSmallImage'] = this.courseSmallImage;
    data['CoursePartnerID'] = this.coursePartnerId;
    data['LearnerID'] = this.learnerId;
    data['LearnerUsername'] = this.learnerUsername;
    data['LearnerName'] = this.learnerName;
    data['LearnerFamily'] = this.learnerFamily;
    data['LearnerImage'] = this.learnerImage;
    data['SupervisorUsername'] = this.supervisorUsername;
    data['SupervisorName'] = this.supervisorName;
    data['SupervisorFamily'] = this.supervisorFamily;
    data['SupervisorImage'] = this.supervisorImage;
    data['FilePath'] = this.filePath;
    data['LearnerImagePath'] = this.learnerImagePath;
    data['SupervisorImagePath'] = this.supervisorImagePath;
    return data;
  }
}
