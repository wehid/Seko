import 'package:flutter/material.dart';

import '../../Models/ObjectModels/survey_question.dart';
import '../../Models/ObjectModels/survey_answer.dart';
import '../../constants.dart';
import '../../GlobalWidgets/seko_text_form_field.dart';
import '../Widgets/past_answer_text.dart';

class SurveyQuestionItem extends StatefulWidget {
  final SurveyQuestion surveyQuestion;
  final SurveyAnswer pastAnswer;
  final bool isAnsweredBefore;
  final Function(SurveyAnswer) addNewAnswer;

  SurveyQuestionItem({
    this.surveyQuestion,
    this.pastAnswer,
    this.isAnsweredBefore,
    this.addNewAnswer,
  });

  @override
  _SurveyQuestionItemState createState() => _SurveyQuestionItemState();
}

class _SurveyQuestionItemState extends State<SurveyQuestionItem> {
  TextEditingController _surveyController;
  int _groupValue;

  @override
  void initState() {
    _surveyController = TextEditingController();
    super.initState();
  }

  bool _isSurveyIsMultiChoice() {
    return widget.surveyQuestion.answerType == MULTI_CHOICE_ANSWER_TYPE;
  }

  void _makeAndAddNewAnswer(String answer) {
    SurveyAnswer newAnswer = SurveyAnswer(
      chosenAnswer: _isSurveyIsMultiChoice() ? answer : null,
      answer: !_isSurveyIsMultiChoice() ? answer : null,
      surveyQuestionId: widget.surveyQuestion.id,
    );
    widget.addNewAnswer(newAnswer);
  }

  int _indexOfQuestion(String question) {
    return widget.surveyQuestion.choices.indexOf(question);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.surveyQuestion.question,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          widget.surveyQuestion.answerType == MULTI_CHOICE_ANSWER_TYPE
              ? Column(
                  children: widget.surveyQuestion.choices
                      .map(
                        (question) => RadioListTile(
                          value: _indexOfQuestion(question),
                          groupValue: widget.isAnsweredBefore
                              ? int.parse(widget.pastAnswer.chosenAnswer) - 1
                              : _groupValue,
                          title: Text(question),
                          onChanged: (value) {
                            setState(() => _groupValue = value);
                            _makeAndAddNewAnswer((value + 1).toString());
                          },
                        ),
                      )
                      .toList())
              : widget.isAnsweredBefore
                  ? PastAnswerText(widget.pastAnswer.answer)
                  : SekoTextFormField(
                      label: "تێبینی",
                      textInputType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      controller: _surveyController,
                      onChange: _makeAndAddNewAnswer,
                    ),
          Divider(),
        ],
      ),
    );
  }
}
