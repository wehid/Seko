class SearchSurvey {
  String itemId;
  String courseLearnerId;
  String includeAnswers;
  String orderBy;
  String orderDir;
  int page;

  SearchSurvey({
    this.itemId,
    this.courseLearnerId,
    this.includeAnswers = "1",
    this.orderBy = "ID",
    this.orderDir = "asc",
    this.page = 1,
  });

  SearchSurvey.fromJson(Map<String, dynamic> json) {
    itemId = json['ItemID'];
    courseLearnerId = json['CourseLearnerID'];
    includeAnswers = json['IncludeAnswers'];
    orderBy = json['OrderBy'];
    orderDir = json['OrderDir'];
    page = json['Page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ItemID'] = this.itemId;
    data['CourseLearnerID'] = this.courseLearnerId;
    data['IncludeAnswers'] = this.includeAnswers;
    data['OrderBy'] = this.orderBy;
    data['OrderDir'] = this.orderDir;
    data['Page'] = this.page;
    return data;
  }
}
