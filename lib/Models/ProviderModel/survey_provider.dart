import 'package:flutter/material.dart';
import 'dart:convert';

import '../../Services/api.dart';
import '../RequestModels/search_survey_question.dart';
import '../ObjectModels/survey_question.dart';
import '../ObjectModels/survey.dart';
import '../RequestModels/search_survey.dart';

class SurveyProvider with ChangeNotifier {
  bool _isLoading = false;
  List<SurveyQuestion> _surveyQuestionList = [];
  List<Survey> _surveyList = [];
  final SearchSurveyQuestion searchAllSurvey = SearchSurveyQuestion(itemId: '');

  Future getAllSurveyQuestion() async {
    _isLoading = true;
    List<SurveyQuestion> response = [];

    try {
      String allSurveyQuestionString =
          await Api().getSurveyQuestion(searchAllSurvey);

      Iterable iterable = json.decode(allSurveyQuestionString)["Data"];
      response = iterable.map((item) => SurveyQuestion.fromJson(item)).toList();

      //todo: delete print
      print(
          'in get all survey, number of survey question is: ${response.length}');

      _isLoading = false;
      _surveyQuestionList = response;
      notifyListeners();
    } catch (error) {
      print('in get all survey question error is: $error');
      throw error;
    }
  }

  Future getSurveyInCourseLearner(
      String courseLearnerId, String userToken) async {
    SearchSurvey searchSurvey = SearchSurvey(courseLearnerId: courseLearnerId);
    _isLoading = true;
    List<Survey> response = [];

    try {
      String surveyInCurseLearnerString =
          await Api().getSurvey(searchSurvey, userToken);

      Iterable iterable = json.decode(surveyInCurseLearnerString)["Data"];
      response = iterable.map((element) => Survey.fromJson(element)).toList();
      //todo: delete print
      print(
          'in get survey in curse learner, survey size is: ${response.length}');
      _isLoading = false;
      _surveyList = response;
      notifyListeners();
    } catch (error) {
      print('in get quiz in curse learner error is: $error');
      throw error;
    }
  }

  List<SurveyQuestion> getSurveyQuestionsByItemId(String itemId) {
    List<SurveyQuestion> response = [];
    response = _surveyQuestionList
        .where((element) => element.itemId == itemId)
        .toList();
    return response;
  }

  Survey itemSurvey(String itemId) {
    bool isAnsweredBefore =
        _surveyList.any((element) => element.itemId == itemId);
    return isAnsweredBefore
        ? _surveyList.firstWhere((element) => element.itemId == itemId)
        : null;
  }

  Future sendAnswerOfSurvey(Survey answerOfSurvey, String userToken) async {
    _isLoading = true;
    notifyListeners();
    Survey response;

    try {
      String surveyAnswerString =
          await Api().sendSurveyAnswer(answerOfSurvey, userToken);

      response = Survey.fromJson(json.decode(surveyAnswerString));
      //todo: delete print
      print(
          'in send answer of survey , survey date is: ${response.createDate}');
      _isLoading = false;
      _surveyList.add(response);
      notifyListeners();
    } catch (error) {
      print('in send answer of survey, error is: $error');
      throw error;
    }
  }

  // List<SurveyQuestion> get surveyQuestionList => _surveyQuestionList;

  bool get isLoading => _isLoading;

  List<Survey> get surveyList => _surveyList;
}
