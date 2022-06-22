class SearchUserItemFile {
  String itemId;
  String userItemId;
  String supervisorId;
  String status;
  String excludeStatus;
  String userId;
  String courseLearnerId;
  String orderBy;
  String orderDir;
  int page;
  int rowsPerPage;

  SearchUserItemFile({
    this.itemId,
    this.userItemId,
    this.supervisorId,
    this.status,
    this.excludeStatus,
    this.userId,
    this.courseLearnerId,
    this.orderBy = "ID",
    this.orderDir = "desc",
    this.page = 1,
    this.rowsPerPage,
  });

  SearchUserItemFile.fromJson(Map<String, dynamic> json) {
    itemId = json['ItemID'];
    userItemId = json['UserItemID'];
    supervisorId = json['SupervisorID'];
    status = json['Status'];
    excludeStatus = json['ExcludeStatus'];
    userId = json['UserID'];
    courseLearnerId = json['CourseLearnerID'];
    orderBy = json['OrderBy'];
    orderDir = json['OrderDir'];
    page = json['Page'];
    rowsPerPage = json['RowsPerPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ItemID'] = this.itemId;
    data['UserItemID'] = this.userItemId;
    data['SupervisorID'] = this.supervisorId;
    data['Status'] = this.status;
    data['ExcludeStatus'] = this.excludeStatus;
    data['UserID'] = this.userId;
    data['CourseLearnerID'] = this.courseLearnerId;
    data['OrderBy'] = this.orderBy;
    data['OrderDir'] = this.orderDir;
    data['Page'] = this.page;
    data['RowsPerPage'] = this.rowsPerPage;
    return data;
  }
}
