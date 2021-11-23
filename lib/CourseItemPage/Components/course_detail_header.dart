import 'package:flutter/material.dart';

import '../../Models/ObjectModels/course.dart';
import 'course_define.dart';

class CourseDetailHeader extends StatelessWidget {
  final Course myCourse;

  CourseDetailHeader(this.myCourse);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: CourseDefine(myCourse),
        ),
        Flexible(
          flex: 1,
          child: Container(
            height: 150,
            child: myCourse.smallImagePath.length == 0
                ? Hero(
                    tag: myCourse.id,
                    child: Image.asset(
                      "assets/images/ferkary.jpg",
                      fit: BoxFit.fitHeight,
                    ),
                  )
                : Hero(
                    tag: myCourse.name,
                    child: Image.network(myCourse.smallImagePath),
                  ),
          ),
        ),
      ],
    );
  }
}
