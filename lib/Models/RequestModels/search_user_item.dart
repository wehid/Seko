class SearchUserItem {
  String courseId;
  String userId;
  String itemId;
  String status;
  String orderBy;
  String orderDir;
  int page;

  SearchUserItem({
    this.courseId,
    this.userId,
    this.itemId,
    this.status = "2",
    this.orderBy = "ItemID",
    this.orderDir = "asc",
    this.page = 1,
  });

  SearchUserItem.fromJson(Map<String, dynamic> json) {
    courseId = json['CourseID'];
    userId = json['UserID'];
    itemId = json['ItemID'];
    status = json['Status'];
    orderBy = json['OrderBy'];
    orderDir = json['OrderDir'];
    page = json['Page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CourseID'] = this.courseId;
    data['UserID'] = this.userId;
    data['ItemID'] = this.itemId;
    data['Status'] = this.status;
    data['OrderBy'] = this.orderBy;
    data['OrderDir'] = this.orderDir;
    data['Page'] = this.page;
    return data;
  }
}
