import 'package:flutter/material.dart';
import 'dart:convert';

import '../../Services/api.dart';
import '../ObjectModels/quiz_question.dart';
import '../ObjectModels/quiz.dart';
import '../RequestModels/search_question.dart';
import '../RequestModels/search_quiz.dart';

class QuizProvider with ChangeNotifier {
  bool _isLoading = false;
  List<QuizQuestion> _questionList = [];
  List<Quiz> _quizList = [];

  // Quiz newExam;

  Future getAllQuestions() async {
    _isLoading = true;
    List<QuizQuestion> response = [];
    SearchQuestion searchAllQuestion = SearchQuestion();

    try {
      String allQuestionString = await Api().getQuestions(searchAllQuestion);

      Iterable iterable = json.decode(allQuestionString)["Data"];
      response = iterable.map((item) => QuizQuestion.fromJson(item)).toList();

      //todo: delete print
      print('in get all question, number of questions is: ${response.length}');

      _isLoading = false;
      _questionList = response;
      notifyListeners();
    } catch (error) {
      print('error in get all question is: $error');
      throw error;
    }
  }

  Future getQuizInCurseLearner(String courseLearnerId, String userToken) async {
    SearchQuiz searchQuiz = SearchQuiz(courseLearnerId: courseLearnerId);
    _isLoading = true;
    List<Quiz> response = [];

    try {
      String quizInCurseLearnerString =
          await Api().getQuiz(searchQuiz, userToken);

      Iterable iterable = json.decode(quizInCurseLearnerString)["Data"];
      response = iterable.map((element) => Quiz.fromJson(element)).toList();
      //todo: delete print
      print('in get quiz in curse learner, quiz size is: ${response.length}');
      _isLoading = false;
      _quizList = response;
      notifyListeners();
    } catch (error) {
      print('in get quiz in curse learner error is: $error');
      throw error;
    }
  }

  // Future searchQuestionsByItemId(String itemId) async {
  //   _isLoading = true;
  //   List<QuizQuestion> response = [];
  //   SearchQuestion searchAllQuestion = SearchQuestion(itemId: itemId);
  //
  //   try {
  //     String allQuestionString = await Api().getQuestions(searchAllQuestion);
  //     //  todo: delete print
  //     print(allQuestionString);
  //     Iterable iterable = json.decode(allQuestionString)["Data"];
  //     response = iterable.map((item) => QuizQuestion.fromJson(item)).toList();
  //
  //     _isLoading = false;
  //     _questionList = response;
  //     notifyListeners();
  //   } catch (error) {
  //     print('error in get all question is: $error');
  //     throw error;
  //   }
  // }

  Future sendAnswerOfQuiz(Quiz answerOfQuiz, String userToken) async {
    _isLoading = true;
    notifyListeners();
    Quiz response;

    try {
      String quizAnswerString =
          await Api().sendQuizAnswer(answerOfQuiz, userToken);
      //  todo: delete print
      print(quizAnswerString);
      response = Quiz.fromJson(json.decode(quizAnswerString));
      //todo: delete print
      print('in send answer of quiz , quiz degree is: ${response.totalDegree}');
      _isLoading = false;
      _quizList.add(response);
      // _addOrReplaceOneQuizInQuizList(response);
      notifyListeners();
    } catch (error) {
      print('in send answer of quiz, error is: $error');
      throw error;
    }
  }

  // void _addOrReplaceOneQuizInQuizList(Quiz quiz) {
  //   int index = -1;
  //   Quiz pastQuiz = _quizList
  //       .firstWhere((element) => element.itemId == quiz.itemId, orElse: null);
  //   if (pastQuiz != null) index = _quizList.indexOf(pastQuiz);
  //   index != -1 ? _quizList[index] = quiz : _quizList.add(quiz);
  //   notifyListeners();
  // }

  // List<QuizAnswer> pastAnswers(String itemId) {
  //   return itemQuiz(itemId).answers;
  // }

  Quiz itemQuiz(String itemId) {
    // if(_quizList.length == 0) return null;
    // Quiz pastQuiz= _quizList.firstWhere((element) => element.itemID == itemId, orElse: null);
    // return pastQuiz == null? null: pastQuiz;

    bool isAnsweredBefore =
        _quizList.any((element) => element.itemId == itemId);
    return isAnsweredBefore
        ? _quizList.firstWhere((element) => element.itemId == itemId)
        : null;
  }

  List<QuizQuestion> getQuestionByItemId(String itemId) {
    List<QuizQuestion> response = [];
    response =
        _questionList.where((element) => element.itemId == itemId).toList();
    return response;
  }

  bool get isLoading => _isLoading;

  List<QuizQuestion> get questionList => _questionList;

  List<Quiz> get quizList => _quizList;

// //  ---------------------------- New Exam -------------------------------
//   void answerNewExam(String itemId, String courseLearnerId, QuizAnswer answer) {
//     _isStartedExam(itemId)?_addOrUpdateAnswer(answer):_makeNewExam(itemId, courseLearnerId, answer);
//   }
//
//
//   void _makeNewExam(String itemId, String courseLearnerId, QuizAnswer answer) {
//     newExam = null;
//     newExam.itemID = itemId;
//     newExam.courseLearnerID = courseLearnerId;
//     newExam.answers.add(answer);
//   }
//
//
//   //this method check if this answer is stored before, update it, else add to stored answer
//   void _addOrUpdateAnswer(QuizAnswer answer) {
//     int index = -1;
//     QuizAnswer pastAnswer = newExam.answers.firstWhere(
//             (element) => element.quizQuestionId == answer.quizQuestionId,
//         orElse: null);
//     if (pastAnswer != null) index = newExam.answers.indexOf(pastAnswer);
//     index != -1 ? newExam.answers[index] = answer : newExam.answers.add(answer);
//   }
//
//   bool _isStartedExam(String itemId){
//     if (newExam == null) return false;
//     if (newExam.itemID != itemId) return false;
//     return true;
//   }
//
//   List<int> notAnsweredQuestion(String itemId){
//     if (_isCompleteAllAnswerNewExam(itemId)) return null;
//     List<int> notAnsweredQuestionSortIndex = [];
//     for (QuizQuestion question in getQuestionByItemId(itemId)){
//       QuizAnswer answer = newExam.answers.firstWhere((element) => element.quizQuestionId == question.id, orElse: null);
//       if (answer == null) notAnsweredQuestionSortIndex.add(int.parse(question.sortIndex));
//     }
//     return notAnsweredQuestionSortIndex;
//   }
//
//   bool _isCompleteAllAnswerNewExam(String itemId){
//     if (!_isStartedExam(itemId)) return false;
//
//     if(newExam.answers.length != getQuestionByItemId(itemId).length) return false;
//
//     return true;
//   }
}
