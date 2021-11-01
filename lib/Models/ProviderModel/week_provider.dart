import 'package:flutter/material.dart';
import 'dart:convert';

import '../../Services/api.dart';
import '../ObjectModels/week.dart';
import '../ObjectModels/course.dart';
import '../RequestModels/search_week_by_course.dart';

class WeekProvider with ChangeNotifier{
  List<Week> _weekList = [];
  bool _isLoading = false;
  Week _selectedWeek;

  WeekProvider(){
    _getAllWeek();
  }

  Future<void> _getAllWeek()async{
    _isLoading = true;
    List<Week> allWeek = [];

    try{
      String weekListString = await Api().getAllWeek();
      Iterable iterable = json.decode(weekListString);
      allWeek = iterable.map((week) => Week.fromJson(week)).toList();
      _weekList = allWeek;
      _isLoading = false;
      notifyListeners();
    }catch(error){
      print('error in get all course: $error');
      throw error;
    }
  }

  Future<void> getCourseWeeks(Course course) async{
    _isLoading = true;
    List<Week> courseWeek = [];

    SearchWeekByCourse searchWeekByCourse = SearchWeekByCourse(courseID: course.id);

    try{
      String weekListString = await Api().getAllWeekInCourses(searchWeekByCourse);
    //  todo: delete after debugging
      print(weekListString);
      _isLoading = false;

      Iterable iterable = json.decode(weekListString)["Data"];
      courseWeek = iterable.map((item) => Week.fromJson(item)).toList();
      _weekList = courseWeek;

      //todo: this part is for debugging. delete it before release
      print(_weekList.length);
      for (Week week in _weekList) {
        print(week.title);
      }

      notifyListeners();
    }catch (error){
      throw error;
    }

  }

  List<Week> getAllWeekInCourse(String courseId){
    List<Week> courseWeek = [];
    courseWeek = _weekList.where((week) => week.courseID == courseId).toList();
    return courseWeek;
  }

  void setSelectedWeek(Week week){
    _selectedWeek = week;
    notifyListeners();
  }

  List<Week> get weekList => _weekList;

  bool get isLoading => _isLoading;

  Week get selectedWeek => _selectedWeek;
}