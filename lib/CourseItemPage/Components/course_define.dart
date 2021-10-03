import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../Models/ObjectModels/course.dart';

class CourseDefine extends StatelessWidget {
  final Course myCourse;

  CourseDefine(this.myCourse);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ناوی هاوکار: ${myCourse.partnerName}',
            style: titleTextStyle(),
          ),
          Text(
            'لقی: ${myCourse.categoryName}',
            style: titleTextStyle(),
          ),
        ],
      ),
    );
  }
}
