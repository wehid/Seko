class SearchSquadActivity {
  String squadId;
  String activityType;
  String userId;
  String status;
  String orderBy;
  String orderDir;
  int page;
  int rowsPerPage;

  SearchSquadActivity({
    this.squadId,
    this.activityType,
    this.userId,
    this.status,
    this.orderBy = "ID",
    this.orderDir = "desc",
    this.page,
    this.rowsPerPage,
  });

  SearchSquadActivity.fromJson(Map<String, dynamic> json) {
    squadId = json['SquadID'];
    activityType = json['ActivityType'];
    userId = json['UserID'];
    status = json['Status'];
    orderBy = json['OrderBy'];
    orderDir = json['OrderDir'];
    page = json['Page'];
    rowsPerPage = json['RowsPerPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SquadID'] = this.squadId;
    data['ActivityType'] = this.activityType;
    data['UserID'] = this.userId;
    data['Status'] = this.status;
    data['OrderBy'] = this.orderBy;
    data['OrderDir'] = this.orderDir;
    data['Page'] = this.page;
    data['RowsPerPage'] = this.rowsPerPage;
    return data;
  }
}
