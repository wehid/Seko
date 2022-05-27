import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../Models/ObjectModels/course.dart';

class CourseDefine extends StatelessWidget {
  final Course myCourse;

  CourseDefine(this.myCourse);

  final _myColor = Colors.blue.shade600;
  final TextStyle _myStyle =
      titleTextStyle().copyWith(color: Colors.blue.shade600);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ناوی هاوکار: ${myCourse.partnerName}',
            style: _myStyle,
          ),
          SizedBox(
            height: 15,
            child: Center(
              child: Divider(
                thickness: 1,
                color: _myColor,
              ),
            ),
          ),
          Text(
            'ماوەی خول: ${myCourse.hoursPerWeek} هەفتە',
            style: _myStyle,
          ),
        ],
      ),
    );
  }
}
