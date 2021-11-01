class SurveyQuestion {
  String id;
  String itemId;
  String answerType;
  String question;
  String answers;
  String file;
  String sound;
  String sortIndex;
  String lessonID;
  String filePath;
  String soundPath;
  List<String> choices;

  SurveyQuestion({
    this.id,
    this.itemId,
    this.answerType,
    this.question,
    this.answers,
    this.file,
    this.sound,
    this.sortIndex,
    this.lessonID,
    this.filePath,
    this.soundPath,
    this.choices,
  });

  SurveyQuestion.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    itemId = json['ItemID'];
    answerType = json['AnswerType'];
    question = json['Question'];
    answers = json['Answers'];
    file = json['File'];
    sound = json['Sound'];
    sortIndex = json['SortIndex'];
    lessonID = json['LessonID'];
    filePath = json['FilePath'];
    soundPath = json['SoundPath'];
    choices = json['Choices'] == null ? [] : json['Choices'].cast<String>();
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
    data['SortIndex'] = this.sortIndex;
    data['LessonID'] = this.lessonID;
    data['FilePath'] = this.filePath;
    data['SoundPath'] = this.soundPath;
    data['Choices'] = this.choices;
    return data;
  }
}
