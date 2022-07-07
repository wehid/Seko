import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/ProviderModel/lesson_provider.dart';
import '../Models/ProviderModel/courses_provider.dart';
import '../Models/ObjectModels/lesson.dart';
import 'Widget/item_tile.dart';
import '../constants.dart';

class LessonScreen extends StatelessWidget {
  static const routeName = '/lesson_screen';

  @override
  Widget build(BuildContext context) {
    print("lesson screen buil method");
    final _selectedCourse =
        Provider.of<CoursesProvider>(context, listen: false).selectedCourse;

    LessonProvider lessonProvider = Provider.of<LessonProvider>(context);

    final List<Lesson> _myLessons = lessonProvider.lessonList;

    return Scaffold(
      appBar: customAppBar(_selectedCourse.name),
      body: lessonProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  ExpansionPanelList.radio(
                    dividerColor: Colors.blueGrey,
                    animationDuration: const Duration(milliseconds: 550),
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
                ],
              ),
            ),
    );
  }
}
