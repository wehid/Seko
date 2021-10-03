import 'package:flutter/material.dart';
import 'dart:convert';

import '../../Services/api.dart';
import '../ObjectModels/course.dart';
import '../RequestModels/search_course_by_category.dart';

class CoursesProvider with ChangeNotifier {
  bool _isLoadData = false;
  List<Course> _courseList = [];
  Course _selectedCourse;

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
      _courseList = myCourses;
      _isLoadData = false;
      notifyListeners();
    } catch (error) {
      throw error;
    }

    //todo: this part is for debugging. delete it before release
    print('all course list length is: ${myCourses.length}');
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

  List<Course> getCourseListBySelectedCategoryId(String selectedCategoryId) {
    return _courseList
        .where((course) => course.categoryID == selectedCategoryId)
        .toList();
  }

  Course courseById(String courseId){
    return _courseList.firstWhere((course) => course.id == courseId);
  }

  bool get isLoadData => _isLoadData;

  Course get selectedCourse => _selectedCourse;

  List<Course> get courseList => _courseList;
}
