import 'quiz_answer.dart';

class Quiz {
  String id;
  String itemId;
  String courseLearnerId;
  String totalDegree;
  String createDate;
  String itemName;
  String userName;
  List<QuizAnswer> answers;

  Quiz({
    this.id,
    this.itemId,
    this.courseLearnerId,
    this.totalDegree,
    this.createDate,
    this.itemName,
    this.userName,
    this.answers,
  });

  Quiz.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    itemId = json['ItemID'];
    courseLearnerId = json['CourseLearnerID'];
    totalDegree = json['TotalDegree'];
    createDate = json['CreateDate'];
    itemName = json['ItemName'];
    userName = json['UserName'];
    if (json['Answers'] != null) {
      answers = [];
      json['Answers'].forEach((answer) {
        answers.add(QuizAnswer.fromJson(answer));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['ItemID'] = this.itemId;
    data['CourseLearnerID'] = this.courseLearnerId;
    data['TotalDegree'] = this.totalDegree;
    data['CreateDate'] = this.createDate;
    data['ItemName'] = this.itemName;
    data['UserName'] = this.userName;
    if (this.answers != null) {
      data['Answers'] = this.answers.map((answer) => answer.toJson()).toList();
    }
    return data;
  }
}
