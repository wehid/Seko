import 'package:flutter/material.dart';

import '../../Models/ObjectModels/quiz_question.dart';
import '../../GlobalWidgets/seko_text_form_field.dart';
import '../../Models/ObjectModels/quiz_answer.dart';
import '../../constants.dart';
import '../../SurveyFragment/Widgets/past_answer_text.dart';

class QuestionItem extends StatefulWidget {
  final QuizQuestion question;
  final QuizAnswer pastAnswer;
  final QuizAnswer pastNewAnswer;
  final bool isAnsweredBefore;
  final Function(QuizAnswer) addNewAnswer;

  QuestionItem({
    this.question,
    this.pastAnswer,
    this.isAnsweredBefore,
    this.addNewAnswer,
    this.pastNewAnswer,
  });

  @override
  _QuestionItemState createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem> {
  TextEditingController _questionController;
  int _groupValue;
  QuizAnswer newAnswer;
  final Icon _wrongAnswerIcon = Icon(Icons.close, color: Colors.red);
  final Icon _rightAnswerIcon = Icon(Icons.done, color: Colors.green);

  @override
  void initState() {
    _questionController = TextEditingController();
    if (widget.pastNewAnswer != null)
      _groupValue = int.parse(widget.pastNewAnswer.chosenAnswer) - 1;
    super.initState();
  }

  bool _isQuestionIsMultiChoice() {
    return widget.question.answerType == MULTI_CHOICE_ANSWER_TYPE;
  }

  bool _isRightAnswer() {
    if (_isQuestionIsMultiChoice()) {
      return widget.question.correctAnswer == widget.pastAnswer.chosenAnswer;
    } else {
      return widget.question.answers == widget.pastAnswer.answer;
    }
  }

  bool _isShowRightAnswerIcon(int index) {
    return (widget.isAnsweredBefore &&
        int.parse(widget.question.correctAnswer) - 1 == index);
  }

  bool _isShowWrongAnswerIcon(int index) {
    return (widget.isAnsweredBefore &&
        !_isRightAnswer() &&
        int.parse(widget.pastAnswer.chosenAnswer) - 1 == index);
  }

  Icon _showIconInAnswer(int index) {
    if (_isShowRightAnswerIcon(index)) {
      return _rightAnswerIcon;
    } else if (_isShowWrongAnswerIcon(index)) {
      return _wrongAnswerIcon;
    } else {
      return Icon(null);
    }
  }

  String _calculateDegree(String answer) {
    return _isQuestionIsMultiChoice()
        ? widget.question.correctAnswer == answer
            ? widget.question.degree
            : '0'
        : widget.question.answers == answer
            ? widget.question.degree
            : '0';
  }

  void _makeAndAddNewAnswer(String answer) {
    QuizAnswer newAnswer = QuizAnswer(
      chosenAnswer: _isQuestionIsMultiChoice() ? answer : null,
      answer: !_isQuestionIsMultiChoice() ? answer : null,
      quizQuestionId: widget.question.id,
      degree: _calculateDegree(answer),
    );
    widget.addNewAnswer(newAnswer);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    widget.question.question,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                if (widget.question.filePath.length > 0)
                  Image.network(
                    widget.question.filePath,
                    width: 80,
                    height: 80,
                  ),
              ],
            ),
          ),
          _isQuestionIsMultiChoice()
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.question.choices.length,
                  itemBuilder: (context, index) {
                    List<String> answers = widget.question.choices;
                    return RadioListTile(
                      value: index,
                      title: Row(
                        children: [
                          Text(answers[index]),
                          _showIconInAnswer(index),
                        ],
                      ),
                      groupValue: widget.isAnsweredBefore
                          //index of selected answer is chosenAnswer-1
                          ? int.parse(widget.pastAnswer.chosenAnswer) - 1
                          : _groupValue,
                      onChanged: (value) {
                        setState(() {
                          _groupValue = value;
                        });
                        // when the question is multi choice, selected answer is index of question + 1
                        _makeAndAddNewAnswer((index + 1).toString());
                      },
                    );
                  },
                )
              : Column(
                  children: [
                    widget.isAnsweredBefore
                        ? PastAnswerText(widget.pastAnswer.answer)
                        : SekoTextFormField(
                            textInputType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            label: 'وڵام',
                            controller: _questionController,
                            onChange: _makeAndAddNewAnswer,
                          ),
                    const SizedBox(height: 25),
                    if (widget.isAnsweredBefore)
                      Text(
                        "ڕوون کردنەوەی وڵام:    ${widget.question.answerHelp}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )
                  ],
                ),
          Row(
            children: [
              Text('نمرە لە: ${widget.question.degree}'),
              const SizedBox(width: 50),
              widget.isAnsweredBefore
                  ? Text(widget.pastAnswer.degree,
                      style: TextStyle(
                          color: _isRightAnswer() ? Colors.green : Colors.red,
                          fontSize: 18))
                  : Text("وڵام نەدراوەتەوە"),
            ],
          )
        ],
      ),
    );
  }
}
