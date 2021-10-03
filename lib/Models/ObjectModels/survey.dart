import '../ObjectModels/survey_answer.dart';

class Survey {
  String id;
  String itemId;
  String courseLearnerId;
  String createDate;
  String itemName;
  String userName;
  List<SurveyAnswer> answers;

  Survey({
    this.id,
    this.itemId,
    this.courseLearnerId,
    this.createDate,
    this.itemName,
    this.userName,
    this.answers,
  });

  Survey.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    itemId = json['ItemID'];
    courseLearnerId = json['CourseLearnerID'];
    createDate = json['CreateDate'];
    itemName = json['ItemName'];
    userName = json['UserName'];
    if (json['Answers'] != null) {
      answers = [];
      json['Answers'].forEach((answer) {
        answers.add(SurveyAnswer.fromJson(answer));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['ItemID'] = this.itemId;
    data['CourseLearnerID'] = this.courseLearnerId;
    data['CreateDate'] = this.createDate;
    data['ItemName'] = this.itemName;
    data['UserName'] = this.userName;
    if (this.answers != null) {
      data['Answers'] = this.answers.map((answer) => answer.toJson()).toList();
    }
    return data;
  }
}
