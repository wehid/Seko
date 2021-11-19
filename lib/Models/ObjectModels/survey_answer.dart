class SurveyAnswer {
  String id;
  String surveyId;
  String surveyQuestionId;
  String chosenAnswer;
  String answer;

  SurveyAnswer({
    this.id,
    this.surveyId,
    this.surveyQuestionId,
    this.chosenAnswer,
    this.answer,
  });

  SurveyAnswer.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    surveyId = json['SurveyID'];
    surveyQuestionId = json['SurveyQuestionID'];
    chosenAnswer = json['ChosenAnswer'];
    answer = json['Answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['SurveyID'] = this.surveyId;
    data['SurveyQuestionID'] = this.surveyQuestionId;
    data['ChosenAnswer'] = this.chosenAnswer;
    data['Answer'] = this.answer;
    return data;
  }
}
