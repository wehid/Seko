import 'package:flutter/material.dart';
import 'dart:convert';

import '../../Services/api.dart';
import '../ObjectModels/course_learner.dart';
import '../RequestModels/search_course_learner.dart';

class CourseLearnerProvider with ChangeNotifier {
  bool _isLoading = false;
  List<CourseLearner> _allCourseLearners = [];
  CourseLearner _selectedCourseLearner;

  Future<void> getAllCourseLearners(String userToken) async {
    _isLoading = true;
    List<CourseLearner> allCourseLearner = [];

    try {
      String courseLearnerListString = await Api()
          .getCourseLearner(_getSearchCourseLearnerToGetAll(), userToken);

      Iterable iterable = json.decode(courseLearnerListString)["Data"];
      allCourseLearner = iterable
          .map((courseLearner) => CourseLearner.fromJson(courseLearner))
          .toList();
      print(
          'in get all course learner. number of course learner is: ${allCourseLearner.length}');
      _allCourseLearners = allCourseLearner;
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      print('in get all course learner, error is: $error');
      throw error;
    }
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

      _allCourseLearners.add(newCourseLearner);
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      print('in add course to learning, error is: $error');
      throw error;
    }
  }

  List<CourseLearner> getAllLearnerForCourseId(String courseId) {
    return _allCourseLearners
        .where((learner) => learner.courseId == courseId)
        .toList();
  }

  List<CourseLearner> getAllCourseLearningForUserId(String userId) {
    return _allCourseLearners
        .where((learner) => learner.userId == userId)
        .toList();
  }

  bool isLearningThisCourse(String userId, String courseId) {
    // bool isLearning = _allCourseLearners.any(
    //     (element) => element.userId == userId && element.courseId == courseId);
    // if (isLearning)
    //   _selectedCourseLearner = _allCourseLearners.firstWhere((element) =>
    //       element.userId == userId && element.courseId == courseId);
    _selectedCourseLearner = _allCourseLearners.firstWhere(
        (element) => element.userId == userId && element.courseId == courseId,
        orElse: () => null);

    return _selectedCourseLearner != null;
  }

  CourseLearner curseLernerOfThisCourse(String userId, String courseId) {
    return _allCourseLearners.firstWhere(
        (element) => element.userId == userId && element.courseId == courseId,
        orElse: () => null);
  }

  SearchCourseLearner _getSearchCourseLearnerToGetAll() {
    return SearchCourseLearner(
      userId: '',
      courseId: '',
    );
  }

  bool get isLoading => _isLoading;

  CourseLearner get selectedCourseLearner => _selectedCourseLearner;

// List<CourseLearner> get allCourseLearners => _allCourseLearners;
}
