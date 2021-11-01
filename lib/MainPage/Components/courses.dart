import 'package:flutter/material.dart';

import '../../Models/ObjectModels/course.dart';
import '../Widgets/course_item.dart';

class Courses extends StatelessWidget {
  final List<Course> coursesList;

  Courses(this.coursesList);

  bool _isCoursesListEmpty() {
    return coursesList.length == 0;
  }

  @override
  Widget build(BuildContext context) {
    return _isCoursesListEmpty()
        ? Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.yellow,
            child: Center(
              child: Text(
                "بەداخەوە هیچ کوورسێک نییە",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        : GridView.builder(
            itemCount: coursesList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                crossAxisCount: 2,
                childAspectRatio: 280 / 400),
            itemBuilder: (context, index) {
              return CourseItem(coursesList[index]);
            },
          );
  }
}
