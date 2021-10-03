class QuizAnswer {
  String id;
  String quizId;
  String quizQuestionId;
  String chosenAnswer;
  String answer;
  String degree;

  QuizAnswer({
    this.id,
    this.quizId,
    this.quizQuestionId,
    this.chosenAnswer,
    this.answer,
    this.degree,
  });

  QuizAnswer.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    quizId = json['QuizID'];
    quizQuestionId = json['QuizQuestionID'];
    chosenAnswer = json['ChosenAnswer'];
    answer = json['Answer'];
    degree = json['Degree'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['QuizID'] = this.quizId;
    data['QuizQuestionID'] = this.quizQuestionId;
    data['ChosenAnswer'] = this.chosenAnswer;
    data['Answer'] = this.answer;
    data['Degree'] = this.degree;
    return data;
  }
}
