class CreateUserItem {
  String itemId;
  String courseLearnerId;
  String status;

  CreateUserItem({this.itemId, this.courseLearnerId, this.status});

  CreateUserItem.fromJson(Map<String, dynamic> json) {
    itemId = json['ItemID'];
    courseLearnerId = json['CourseLearnerID'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ItemID'] = this.itemId;
    data['CourseLearnerID'] = this.courseLearnerId;
    data['Status'] = this.status;
    return data;
  }
}
