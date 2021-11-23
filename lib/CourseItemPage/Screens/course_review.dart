import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../Models/ObjectModels/course.dart';
import '../Components/course_detail_header.dart';
import '../Components/course_tab_bar.dart';
import '../Components/course_tab_view.dart';
import '../../GlobalWidgets/seko_button.dart';

class CourseReview extends StatefulWidget {
  final Course myCourse;
  final Function addThisCourseToLearning;


  CourseReview(this.myCourse, this.addThisCourseToLearning);

  @override
  _CourseReviewState createState() => _CourseReviewState();
}

class _CourseReviewState extends State<CourseReview> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.myCourse.name),
          centerTitle: true,
        ),
        body: Padding(
          padding:
          const EdgeInsets.only(top: 8.0, left: 8, right: 8, bottom: 5),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CourseDetailHeader(widget.myCourse),
                      Html(data: widget.myCourse.brief),
                      CourseTabBar(),
                      CourseTabView(widget.myCourse),
                      // Divider(thickness: 2),
                      // if (_isLearningThisCourse) WeeksListView(_myCourse.id),
                    ],
                  ),
                ),
              ),
              SekoButton(
                onPressed: widget.addThisCourseToLearning,
                backgroundColor: Colors.green,
                buttonString: 'بەشداری بکە',
                buttonIcon: Icons.menu_book,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
