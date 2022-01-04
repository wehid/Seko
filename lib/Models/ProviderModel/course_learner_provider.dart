import 'package:flutter/material.dart';
import 'dart:convert';

import '../../Services/api.dart';
import '../ObjectModels/course_learner.dart';
import '../RequestModels/search_course_learner.dart';

class CourseLearnerProvider with ChangeNotifier {
  bool _isLoading = false;
  List<CourseLearner> _myCourseLearners = [];
  CourseLearner _selectedCourseLearner;

  Future<List<CourseLearner>> searchCourseLearners(
      String userToken, SearchCourseLearner searchCourseLearner) async {
    List<CourseLearner> response = [];

    try {
      String courseLearnerListString =
          await Api().getCourseLearner(searchCourseLearner, userToken);

      Iterable iterable = json.decode(courseLearnerListString)["Data"];
      response = iterable
          .map((courseLearner) => CourseLearner.fromJson(courseLearner))
          .toList();
      print(
          'in get course learner. number of course learner is: ${response.length}');
      return response;
    } catch (error) {
      print('in get my course learner, error is: $error');
      throw error;
    }
  }


  Future<void> getMyCourseLearners(String userToken, String userId) async {
    _isLoading = true;
    SearchCourseLearner searchMyCourses = SearchCourseLearner(userId: userId);

    _myCourseLearners = await searchCourseLearners(userToken, searchMyCourses);

        // TODO: DELETE PRINT
    for (CourseLearner courseLearner in _myCourseLearners) {
      print(
          "course name is: ${courseLearner.courseName} and course learner id is: ${courseLearner.id}");

    }
    
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addCourseToLearning(
      String courseId, String userId, String userToken) async {
    _isLoading = true;
    notifyListeners();
    CourseLearner courseLearner =
        CourseLearner(courseId: courseId, userId: userId);

    try {
      String courseLearnerString =
          await Api().createCourseLearner(courseLearner, userToken);

      CourseLearner newCourseLearner =
          CourseLearner.fromJson(json.decode(courseLearnerString));

      _myCourseLearners.add(newCourseLearner);
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      print('in add course to learning, error is: $error');
      throw error;
    }
  }

  bool isLearningThisCourse(String courseId) {
    _selectedCourseLearner = _myCourseLearners.firstWhere(
        (element) => element.courseId == courseId,
        orElse: () => null);

    return _selectedCourseLearner != null;
  }

  CourseLearner curseLernerOfThisCourse(String courseId) {
    return _myCourseLearners.firstWhere(
        (element) => element.courseId == courseId,
        orElse: () => null);
  }

  bool get isLoading => _isLoading;

  CourseLearner get selectedCourseLearner => _selectedCourseLearner;

List<CourseLearner> get myCourseLearners => _myCourseLearners;
}
