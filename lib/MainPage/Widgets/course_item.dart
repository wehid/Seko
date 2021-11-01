import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/course_item_top.dart';
import '../../Models/ObjectModels/course.dart';
import '../../Models/ProviderModel/courses_provider.dart';
import '../../CourseItemPage/course_item_screen.dart';

class CourseItem extends StatelessWidget {
  final Course course;
  final Color detailsColor = Colors.grey.shade300;

  CourseItem(this.course);

  Widget detailItem(IconData iconData, String details) {
    return Row(
      children: [
        Icon(iconData, color: detailsColor),
        Text(details,
            style: TextStyle(
                color: detailsColor,
                fontSize: 14,
                fontStyle: FontStyle.italic)),
      ],
    );
  }

  void _openCourse(BuildContext context) {
    //todo: delete print
    print('clicking on course ${course.name} with course id: ${course.id}');
    Provider.of<CoursesProvider>(context, listen: false)
        .setSelectedCourse(course);
    Navigator.of(context).pushNamed(
      CourseItemScreen.routeName,
    );
  }

  Color _getCourseColor() {
    return Color(int.parse("0xff${course.color}"));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openCourse(context),
      child: Container(
        width: 200,
        height: 420,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: _getCourseColor(),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CourseItemTop(course),
            Text(
              course.name,
              textAlign: TextAlign.right,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 17,
                color: Colors.grey.shade200,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            detailItem(Icons.watch_outlined,
                '${course.hoursPerWeek}  کاتژمێر لە حەفتەدا'),
            //todo: this part is for showing description about course. we can show it later
            // Expanded(
            //   child: SingleChildScrollView(
            //     child: Html(
            //       data: course.brief,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
