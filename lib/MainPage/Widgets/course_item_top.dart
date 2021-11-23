import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Models/ObjectModels/course.dart';
import '../../LessonPage/Widget/course_image.dart';

class CourseItemTop extends StatelessWidget {
  final Course course;

  CourseItemTop(this.course);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Stack(
        children: [
          CourseImage(course),
          Positioned(
            top: 10,
            right: 5,
            left: 5,
            child: Container(
              // width: 80,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.blueAccent.shade700.withOpacity(0.6),
              ),
              child: Center(
                child: Text(
                  course.categoryName,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
