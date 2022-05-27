import 'package:flutter/material.dart';

import '../../Models/ObjectModels/course.dart';
import '../Components/course_detail_header.dart';
import '../Components/course_tab_bar.dart';
import '../Components/course_tab_view.dart';
import '../../GlobalWidgets/seko_button.dart';
import '../../constants.dart';

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
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: customAppBar(widget.myCourse.name),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 8.0, left: 8, right: 8, bottom: 5),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CourseDetailHeader(widget.myCourse),
                    CourseTabBar(),
                    const SizedBox(height: 15),
                    Expanded(child: CourseTabView(widget.myCourse)),
                    const SizedBox(height: 15),
                  ],
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
