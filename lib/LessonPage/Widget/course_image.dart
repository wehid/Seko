import 'package:flutter/material.dart';

import '../../Models/ObjectModels/course.dart';
import '../../GlobalWidgets/image_with_progress.dart';

class CourseImage extends StatelessWidget {
  final Course course;

  CourseImage(this.course);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      child: Hero(
        tag: course.id,
        child: course.smallImagePath.length == 0
            ? Image.asset("assets/images/ferkary.jpg")
            : ImageWithProgress(course.smallImagePath),
      ),
    );
  }
}
