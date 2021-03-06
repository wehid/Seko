import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ObjectModels/course_learner.dart';
import '../../Models/ProviderModel/courses_provider.dart';
import '../../Models/ProviderModel/course_learner_provider.dart';
import '../../Models/ObjectModels/course.dart';
import '../../MainPage/Components/courses.dart';
import '../../Models/ProviderModel/user_provider.dart';

class MyCourses extends StatelessWidget {
  static const routeName = '/my-courses';

  List<Course> _myLearningCourse(
      List<CourseLearner> myCourseLearner, BuildContext context) {
    List<Course> myCourses = [];
    for (CourseLearner courseLearner in myCourseLearner) {

      Course course = Provider.of<CoursesProvider>(context, listen: false)
          .courseById(courseLearner.courseId);
      if (course != null) myCourses.add(course);
    }
    print('make course from course learner. length is: ${myCourses.length}');
    return myCourses;
  }

  @override
  Widget build(BuildContext context) {
    // String userId = Provider.of<UserProvider>(context, listen: false).user.id;
    final CourseLearnerProvider _courseLearnerProvider =
        Provider.of<CourseLearnerProvider>(context, listen: false);
    List<CourseLearner> _myCourseLearner =
        _courseLearnerProvider.myCourseLearners;

    print("in get my curses, courses length is: ${_myCourseLearner.length}");

    return Courses(_myLearningCourse(_myCourseLearner, context));
  }
}
