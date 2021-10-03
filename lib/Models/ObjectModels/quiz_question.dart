class QuizQuestion {
  String id;
  String itemId;
  String answerType;
  String question;
  String answers;
  String file;
  String sound;
  String correctAnswer;
  String sortIndex;
  String degree;
  String answerHelp;
  String lessonId;
  String filePath;
  String soundPath;
  List<String> choices;

  QuizQuestion({
    this.id,
    this.itemId,
    this.answerType,
    this.question,
    this.answers,
    this.file,
    this.sound,
    this.correctAnswer,
    this.sortIndex,
    this.degree,
    this.answerHelp,
    this.lessonId,
    this.filePath,
    this.soundPath,
    this.choices,
  });

  QuizQuestion.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    itemId = json['ItemID'];
    answerType = json['AnswerType'];
    question = json['Question'];
    answers = json['Answers'];
    file = json['File'];
    sound = json['Sound'];
    correctAnswer = json['CorrectAnswer'];
    sortIndex = json['SortIndex'];
    degree = json['Degree'];
    answerHelp = json['AnswerHelp'];
    lessonId = json['LessonID'];
    filePath = json['FilePath'];
    soundPath = json['SoundPath'];
    choices = json['Choices'] == null? []:json['Choices'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['ItemID'] = this.itemId;
    data['AnswerType'] = this.answerType;
    data['Question'] = this.question;
    data['Answers'] = this.answers;
    data['File'] = this.file;
    data['Sound'] = this.sound;
    data['CorrectAnswer'] = this.correctAnswer;
    data['SortIndex'] = this.sortIndex;
    data['Degree'] = this.degree;
    data['AnswerHelp'] = this.answerHelp;
    data['LessonID'] = this.lessonId;
    data['FilePath'] = this.filePath;
    data['SoundPath'] = this.soundPath;
    data['Choices'] = this.choices;
    return data;
  }
}
