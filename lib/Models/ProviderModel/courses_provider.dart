import 'package:flutter/material.dart';
import 'dart:convert';

import '../../Services/api.dart';
import '../ObjectModels/course.dart';
import '../RequestModels/search_course_by_category.dart';

class CoursesProvider with ChangeNotifier {
  static const _TEAM_COURSES = "2";
  static const _ALONE_COURSES = "1";
  static const _ACTIVE_COURSE_STATUS = "2";
  bool _isLoadData = false;
  List<Course> _allCourse =
      []; //listed all course, both active and inactive courses.
  List<Course> _courseList = []; //listed only active course.
  Course _selectedCourse;
  List<Course> _showingCourses = [];

  CoursesProvider() {
    getAllCourses();
  }

  // get all course from api.
  Future<void> getAllCourses() async {
    _isLoadData = true;
    List<Course> myCourses = [];
    try {
      String courseListString = await Api().getAllCourses();
      Iterable iterable = json.decode(courseListString);
      myCourses = iterable.map((item) => Course.fromJson(item)).toList();
      _allCourse =
          myCourses; //in here we keep all course and later remove inactive course to show.
      myCourses = myCourses
          .where((course) => course.status == _ACTIVE_COURSE_STATUS)
          .toList();
      _courseList = myCourses.reversed.toList();
      _showingCourses = _courseList;
      _isLoadData = false;
      notifyListeners();
    } catch (error) {
      throw error;
    }

    //todo: this part is for debugging. delete it before release
    print(
        'all course list length is: ${_allCourse.length} and active courses is: ${_courseList.length}');
  }

  // get all course in category from api and return them.
  Future<void> getCourseInCategory(String categoryId) async {
    _isLoadData = true;
    _courseList = [];
    List<Course> myCourses = [];

    SearchCourseByCategory searchCourse =
        SearchCourseByCategory(categoryID: categoryId);
    try {
      String courseListString = await Api().getCoursesInCategory(searchCourse);
      _isLoadData = false;
      Iterable iterable = json.decode(courseListString)["Data"];
      myCourses = iterable.map((item) => Course.fromJson(item)).toList();
      _courseList = myCourses;

      //todo: this part is for debugging. delete it before release
      print('all course list length is: ${myCourses.length}');

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  void setSelectedCourse(Course chosenCourse) {
    _selectedCourse = chosenCourse;
    notifyListeners();
  }

  void showCoursesBySelectedCategoryId(String selectedCategoryId) {
    _showingCourses = _courseList
        .where((course) => course.categoryID == selectedCategoryId)
        .toList();

    notifyListeners();
  }

  void showCoursesWithWord(String searched) {
    _showingCourses =
        _courseList.where((course) => course.name.contains(searched)).toList();

    notifyListeners();
  }

  void showTeamCourses() {
    _showingCourses = _courseList
        .where((course) => course.studyType == _TEAM_COURSES)
        .toList();

    notifyListeners();
  }

  void showAloneCourses() {
    _showingCourses = _courseList
        .where((course) => course.studyType == _ALONE_COURSES)
        .toList();

    notifyListeners();
  }

  void showCoursesReverse() {
    _showingCourses = _courseList.reversed.toList();

    notifyListeners();
  }

  void showAllCourse() {
    _showingCourses = _courseList;
    notifyListeners();
  }

  Course courseById(String courseId) {
    Course course = _allCourse.firstWhere((course) => course.id == courseId);
    return course.status == _ACTIVE_COURSE_STATUS ? course : null;
  }

  bool get isLoadData => _isLoadData;

  Course get selectedCourse => _selectedCourse;

  List<Course> get courseList => _showingCourses;
}
