import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../Models/ObjectModels/course.dart';

class CourseTabView extends StatelessWidget {
  final Course myCourse;

  CourseTabView(this.myCourse);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: TabBarView(
        children: [
          SingleChildScrollView(
            child: Html(data: '${myCourse.overview}'),
          ),
          SingleChildScrollView(
            child: Html(data: '${myCourse.topics}'),
          ),
          SingleChildScrollView(
            child: Html(data: '${myCourse.requirements}'),
          ),
        ],
      ),
    );
  }
}
