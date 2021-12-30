import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/ProviderModel/lesson_provider.dart';
import '../Models/ProviderModel/courses_provider.dart';
import '../Models/ObjectModels/lesson.dart';
import 'Widget/item_tile.dart';
import '../constants.dart';

class LessonScreen extends StatelessWidget {
  static const routeName = '/lesson_screen';

  final int _firstIndex = 0;
  List<Lesson> _myLessons;

  @override
  Widget build(BuildContext context) {
    final _selectedCourse =
        Provider.of<CoursesProvider>(context, listen: false).selectedCourse;

    LessonProvider lessonProvider = Provider.of<LessonProvider>(context);

    _myLessons = lessonProvider.lessonList;

    return Scaffold(
      appBar: customAppBar(_selectedCourse.name),
      body: lessonProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: ExpansionPanelList.radio(
                dividerColor: Colors.blueGrey,
                animationDuration: const Duration(milliseconds: 550),
                //for the first run, define witch one is open.
                // type of this parameter should same to type of value parameter.
                initialOpenPanelValue: _myLessons[_firstIndex],
                children: _myLessons.map((lesson) {
                  return ExpansionPanelRadio(
                    canTapOnHeader: true,
                    // this value is like key for define witch item is expanded
                    value: lesson,
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text(
                          lesson.title,
                          style: TextStyle(color: Colors.brown.shade600),
                        ),
                      );
                    },
                    body: Column(
                        children: lesson.items
                            .map((lesson) => ItemTile(lesson))
                            .toList()),
                  );
                }).toList(),
              ),
            ),
    );
  }
}
