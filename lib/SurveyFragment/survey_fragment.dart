import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seko/constants.dart';

import '../Models/ObjectModels/survey_question.dart';
import '../Models/ObjectModels/survey_answer.dart';
import '../Models/ProviderModel/survey_provider.dart';
import '../Models/ProviderModel/course_learner_provider.dart';
import 'Widgets/survey_question_item.dart';
import '../GlobalWidgets/seko_button.dart';
import '../Models/ObjectModels/survey.dart';
import '../Models/ProviderModel/user_provider.dart';

class SurveyFragment extends StatefulWidget {
  final String itemId;

  SurveyFragment(this.itemId);

  @override
  _SurveyFragmentState createState() => _SurveyFragmentState();
}

class _SurveyFragmentState extends State<SurveyFragment> {
  List<SurveyQuestion> _mySurveyQuestion;
  Survey _pastItemSurvey;
  bool _isAnsweredBefore;
  Survey _newAnswerSurvey;
  SurveyProvider _surveyProvider;

  @override
  void initState() {
    _surveyProvider = Provider.of<SurveyProvider>(context, listen: false);
    _mySurveyQuestion =
        _surveyProvider.getSurveyQuestionsByItemId(widget.itemId);
    _pastItemSurvey = _surveyProvider.itemSurvey(widget.itemId);
    _isAnsweredBefore = _pastItemSurvey != null;

    _newAnswerSurvey = Survey(
      itemId: widget.itemId,
      courseLearnerId:
          Provider.of<CourseLearnerProvider>(context, listen: false)
              .selectedCourseLearner
              .id,
      answers: [],
    );

    super.initState();
  }

  SurveyAnswer _pastAnswerOfSurvey(SurveyQuestion question) {
    return _pastItemSurvey.answers
        .firstWhere((element) => element.surveyQuestionId == question.id);
  }

  /// the methods for new survey answer

  void _addAnswerToNewSurvey(SurveyAnswer answer) {
    _isThisAnsweredInNewSurvey(answer.surveyQuestionId)
        ? _replaceNewAnswerToOldOne(answer)
        : _newAnswerSurvey.answers.add(answer);
  }

  bool _isThisAnsweredInNewSurvey(String surveyQuestionId) {
    return _newAnswerSurvey.answers
        .any((element) => element.surveyQuestionId == surveyQuestionId);
  }

  void _replaceNewAnswerToOldOne(SurveyAnswer newAnswer) {
    SurveyAnswer oldAnswer = _answerInNewSurvey(newAnswer.surveyQuestionId);
    int oldAnswerIndex = _newAnswerSurvey.answers.indexOf(oldAnswer);
    _newAnswerSurvey.answers[oldAnswerIndex] = newAnswer;
  }

  SurveyAnswer _answerInNewSurvey(String surveyQuestionId) {
    return _newAnswerSurvey.answers
        .firstWhere((element) => element.surveyQuestionId == surveyQuestionId);
  }

  void _sendNewSurvey() {
    if (_isCompleteTheSurvey()) {
      _surveyProvider
          .sendAnswerOfSurvey(_newAnswerSurvey,
              Provider.of<UserProvider>(context, listen: false).token)
          //todo change this part for rebuilding
          .then((_) => initState());
    } else {
      _findAndShowUnAnsweredSurvey();
    }
  }

  void _findAndShowUnAnsweredSurvey() {
    List<String> unAnsweredSurveySortIndex = [];
    for (SurveyQuestion question in _mySurveyQuestion) {
      if (!_newAnswerSurvey.answers
          .any((element) => element.surveyQuestionId == question.id))
        unAnsweredSurveySortIndex.add(question.sortIndex);
    }
    showUnAnsweredAlertDialog(unAnsweredSurveySortIndex.join(', '), context);
  }

  bool _isCompleteTheSurvey() {
    return _newAnswerSurvey.answers.length == _mySurveyQuestion.length;
  }

  @override
  Widget build(BuildContext context) {
    _surveyProvider = Provider.of<SurveyProvider>(context);
    return _surveyProvider.isLoading
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _mySurveyQuestion.length,
                itemBuilder: (context, index) {
                  return SurveyQuestionItem(
                    isAnsweredBefore: _isAnsweredBefore,
                    surveyQuestion: _mySurveyQuestion[index],
                    addNewAnswer: _addAnswerToNewSurvey,
                    pastAnswer: _isAnsweredBefore
                        ? _pastAnswerOfSurvey(_mySurveyQuestion[index])
                        : null,
                  );
                },
              ),
              if (!_isAnsweredBefore)
                Row(
                  children: [
                    Spacer(),
                    SekoButton(
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      buttonIcon: Icons.save,
                      buttonString: 'ناردن',
                      onPressed: _sendNewSurvey,
                    )
                  ],
                )
            ],
          );
  }
}
