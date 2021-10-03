import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/ObjectModels/quiz.dart';
import '../Models/ProviderModel/quiz_provider.dart';
import '../Models/ObjectModels/quiz_question.dart';
import '../Models/ObjectModels/quiz_answer.dart';
import '../Models/ProviderModel/user_provider.dart';
import '../Models/ProviderModel/course_learner_provider.dart';
import 'Components/question_number_list.dart';
import 'Widgets/question_item.dart';
import 'Components/quiz_bottom.dart';
import '../constants.dart';

class QuizFragment extends StatefulWidget {
  final String itemId;

  QuizFragment(this.itemId);

  @override
  _QuizFragmentState createState() => _QuizFragmentState();
}

class _QuizFragmentState extends State<QuizFragment> {
  List<QuizQuestion> _myQuestions;
  PageController _quizPageController;
  int _currentIndex = 0;
  Quiz _itemQuiz;
  bool _isAnsweredBefore;
  Quiz _newExam;
  final Duration _duration = Duration(milliseconds: 500);
  final Curve _curve = Curves.easeOutBack;
  QuizProvider _quizProvider;

  @override
  void initState() {
    _myQuestions = Provider.of<QuizProvider>(context, listen: false)
        .getQuestionByItemId(widget.itemId);
    _quizPageController = PageController(initialPage: _currentIndex);
    _itemQuiz = Provider.of<QuizProvider>(context, listen: false)
        .itemQuiz(widget.itemId);
    _isAnsweredBefore = _itemQuiz != null;

    _newExam = Quiz(
      itemId: widget.itemId,
      courseLearnerId:
          Provider.of<CourseLearnerProvider>(context, listen: false)
              .selectedCourseLearner
              .id,
      answers: [],
    );

    super.initState();
  }

  bool isFirstQuestion(int index) {
    return index == 0;
  }

  bool isLastQuestion(int index) {
    ///last index is length-1
    return index == _myQuestions.length - 1;
  }

  QuizAnswer _pastAnswerOfQuestion(QuizQuestion question) {
    return _itemQuiz.answers
        .firstWhere((element) => element.quizQuestionId == question.id);
  }

  /// the methods for new Exam

  void _addAnswerToNewExam(QuizAnswer newAnswer) {
    _isThisAnsweredInNewExam(newAnswer.quizQuestionId)
        ? _replaceNewAnswerToOldOne(newAnswer)
        : _newExam.answers.add(newAnswer);
  }

  bool _isThisAnsweredInNewExam(String quizQuestionId) {
    return _newExam.answers
        .any((element) => element.quizQuestionId == quizQuestionId);
  }

  void _replaceNewAnswerToOldOne(QuizAnswer newAnswer) {
    QuizAnswer oldAnswer = _answerInNewExam(newAnswer.quizQuestionId);
    int oldAnswerIndex = _newExam.answers.indexOf(oldAnswer);
    _newExam.answers[oldAnswerIndex] = newAnswer;
  }

  QuizAnswer _answerInNewExam(String quizQuestionId) {
    return _newExam.answers
        .firstWhere((element) => element.quizQuestionId == quizQuestionId);
  }

  void _sendNewExam() {
    if (_isCompleteTheExam()) {
      _newExam.totalDegree = _calculateDegree().toString();
      _quizProvider
          .sendAnswerOfQuiz(
              _newExam, Provider.of<UserProvider>(context, listen: false).token)
          //todo change this part for rebuilding
          .then((_) => initState());

      ///this call initState make an error.
    } else {
      _findAndShowUnAnsweredQuestion();
    }
  }

  bool _isCompleteTheExam() {
    return _newExam.answers.length == _myQuestions.length;
  }

  int _calculateDegree() {
    int degree = 0;
    for (QuizAnswer answer in _newExam.answers) {
      degree += int.parse(answer.degree);
    }
    return degree;
  }

  void _findAndShowUnAnsweredQuestion() {
    List<String> unAnsweredQuestionSortIndex = [];
    for (QuizQuestion question in _myQuestions) {
      if (!_newExam.answers
          .any((element) => element.quizQuestionId == question.id))
        unAnsweredQuestionSortIndex.add(question.sortIndex);
    }
    showUnAnsweredAlertDialog(unAnsweredQuestionSortIndex.join(', '), context);
  }



  @override
  Widget build(BuildContext context) {
    _quizProvider = Provider.of<QuizProvider>(context);

    return _quizProvider.isLoading
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: [
              QuestionNumberList(
                numberOfQuestions: _myQuestions.length,
                currentIndex: _currentIndex,
                jumpToThePage: (index) {
                  _quizPageController.jumpToPage(index);
                },
              ),
              Container(
                height: 370,
                child: PageView(
                  controller: _quizPageController,
                  onPageChanged: (index) {
                    _currentIndex = index;
                    setState(() {});
                  },
                  children: _myQuestions
                      .map(
                        (question) => QuestionItem(
                          question: question,
                          isAnsweredBefore: _isAnsweredBefore,
                          pastAnswer: _isAnsweredBefore
                              ? _pastAnswerOfQuestion(question)
                              : null,
                          pastNewAnswer: _isThisAnsweredInNewExam(question.id)
                              ? _answerInNewExam(question.id)
                              : null,
                          addNewAnswer: _addAnswerToNewExam,
                        ),
                      )
                      .toList(),
                ),
              ),
              QuizBottom(
                isAnsweredBefore: _isAnsweredBefore,
                isFirstQuestion: isFirstQuestion(_currentIndex),
                isLastQuestion: isLastQuestion(_currentIndex),
                goToPrevious: () {
                  _quizPageController.previousPage(
                      duration: _duration, curve: _curve);
                },
                goToNext: () {
                  _quizPageController.nextPage(
                      duration: _duration, curve: _curve);
                },
                sendExam: _sendNewExam,
              ),
              const SizedBox(height: 10),
            ],
          );
  }
}
