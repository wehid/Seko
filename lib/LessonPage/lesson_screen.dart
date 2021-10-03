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

  @override
  Widget build(BuildContext context) {
    final _selectedCourse =
        Provider.of<CoursesProvider>(context, listen: false).selectedCourse;
    final List<Lesson> _myLessons =
        Provider.of<LessonProvider>(context, listen: false)
            .getAllLessonsInCourse(_selectedCourse.name, context);

    return Scaffold(
      appBar: customAppBar(_selectedCourse.name),
      //check for _myLessons is empty
      body: _myLessons.length == 0
          //todo: return something better
          ? Center(
              child: Text("هیچ وانەیەک نییە"),
            )
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
