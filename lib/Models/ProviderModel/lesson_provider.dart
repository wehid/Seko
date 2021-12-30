import 'package:flutter/material.dart';
import 'dart:convert';

import '../../Services/api.dart';
import '../ObjectModels/lesson.dart';
import '../RequestModels/search_lesson.dart';
import '../ObjectModels/item.dart';
import '../ProviderModel/item_provider.dart';
import 'item_provider.dart';

class LessonProvider with ChangeNotifier {
  bool _isLoading = false;
  List<Lesson> _lessonList = [];
  Lesson _selectedLesson;

  Future<void> fetchLessonWithItems(String courseId) async {
    _isLoading = true;

    List<Lesson> myLessons = await _fetchLessonList(courseId: courseId);

    List<Lesson> finalLessons = await _fetchItemsForEachLesson(myLessons);

    _setLessonList(finalLessons);
    _setIsLoading(false);
  }

  Future<List<Lesson>> _fetchLessonList({String courseId}) async {
    List<Lesson> myLessons = [];
    if (courseId == null) {
      return null;
    }
    SearchLesson searchLesson = SearchLesson(courseID: courseId);

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

  void _setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setSelectedLesson(Lesson lesson) {
    _selectedLesson = lesson;
    notifyListeners();
  }

  void setSelectedLessonByID(String lessonId) {
    _selectedLesson = _lessonList.firstWhere((lesson) => lesson.id == lessonId);
    notifyListeners();
  }

  void _setLessonList(List<Lesson> lessonList) {
    _lessonList = lessonList;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  Lesson get selectedLesson => _selectedLesson;

  List<Lesson> get lessonList => _lessonList;
}
