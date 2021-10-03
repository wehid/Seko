import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:provider/provider.dart';

import '../../Services/api.dart';
import '../ObjectModels/lesson.dart';
import '../RequestModels/search_lesson.dart';
import '../ObjectModels/item.dart';
import '../ProviderModel/item_provider.dart';
import 'item_provider.dart';

class LessonProvider with ChangeNotifier {
  bool _isLoading = false;
  List<Lesson> _weekLessonList = [];
  List<Lesson> _allLessonList = [];
  Lesson _selectedLesson;

  Future<void> getAllLessons() async {
    List<Lesson> allLessons = [];
    _isLoading = true;

    try {
      String allLessonsString = await Api().getAllLessons();

      Iterable iterable = json.decode(allLessonsString);
      allLessons = iterable.map((item) => Lesson.fromJson(item)).toList();
      _allLessonList = allLessons;
      //todo: delete print
      print('in get all lessons, lessons length is: ${_allLessonList.length}');
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      print('in get all lessons, error is: $error');
      throw error;
    }
  }

  //todo: i don't like use context and provider here. if i found better way, i change it
  List<Lesson> getAllLessonsInCourseAndWeek(
      String courseName, String weekId, BuildContext context) {
    List<Lesson> finalResponse = [];
    List<Lesson> _lessonsInCourseAndWeek = _allLessonList
        .where((lesson) =>
            lesson.courseName == courseName && lesson.weekID == weekId)
        .toList();

    List<Item> allItems =
        Provider.of<ItemProvider>(context, listen: false).allItemList;
    for (Lesson lesson in _lessonsInCourseAndWeek) {
      List<Item> items =
          allItems.where((item) => item.lessonID == lesson.id).toList();
      lesson.items = items;
      finalResponse.add(lesson);
    }
    // _setWeekLessonList(finalResponse);
    _weekLessonList = finalResponse;
    return finalResponse;
  }

  //todo: i don't like use context and provider here. if i found better way, i change it
  List<Lesson> getAllLessonsInCourse(
      String courseName, BuildContext context) {
    List<Lesson> finalResponse = [];
    List<Lesson> _lessonsInCourseAndWeek = _allLessonList
        .where((lesson) =>
    lesson.courseName == courseName).toList();

    List<Item> allItems =
        Provider.of<ItemProvider>(context, listen: false).allItemList;
    for (Lesson lesson in _lessonsInCourseAndWeek) {
      List<Item> items =
      allItems.where((item) => item.lessonID == lesson.id).toList();
      lesson.items = items;
      finalResponse.add(lesson);
    }
    // _setWeekLessonList(finalResponse);
    _weekLessonList = finalResponse;
    return finalResponse;
  }

  //todo: this methods that take every object in internet are to slow, i can delete them.
  Future<List<Lesson>> _fetchLessonList(
      {String courseId, String weekId}) async {
    List<Lesson> myLessons = [];
    if (courseId == null && weekId == null) {
      return null;
    }
    SearchLesson searchLesson =
        SearchLesson(courseID: courseId, weekID: weekId);

    try {
      String lessonListString = await Api().getLessonsBySearch(searchLesson);

      Iterable iterable = json.decode(lessonListString)["Data"];
      myLessons = iterable.map((item) => Lesson.fromJson(item)).toList();

      return myLessons;
    } catch (error) {
      throw error;
    }
  }

  Future<List<Lesson>> _fetchItemsForEachLesson(
      List<Lesson> lessonsList) async {
    List<Lesson> finalLessonsList = [];
    for (Lesson lesson in lessonsList) {
      List<Item> items = await ItemProvider().getItems(lesson.id);
      lesson.items = items;
      finalLessonsList.add(lesson);
    }
    return finalLessonsList;
  }

  Future<void> fetchLessonWithItems({String courseId, String weekId}) async {
    _isLoading = true;

    List<Lesson> myLessons =
        await _fetchLessonList(courseId: courseId, weekId: weekId);

    List<Lesson> finalLessons = await _fetchItemsForEachLesson(myLessons);

    _setWeekLessonList(finalLessons);
    // _isLoading = false;
    _setIsLoading(false);
  }

  void _setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setSelectedLesson(Lesson lesson) {
    _selectedLesson = lesson;
    notifyListeners();
  }

  void setSelectedLessonByID(String lessonId) {
    _selectedLesson = _allLessonList.firstWhere((lesson) => lesson.id == lessonId);
    notifyListeners();
  }

  void _setWeekLessonList(List<Lesson> lessons) {
    _weekLessonList = lessons;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  List<Lesson> get lessonList => _weekLessonList;

  Lesson get selectedLesson => _selectedLesson;

  List<Lesson> get allLessonList => _allLessonList;
}
