import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/ObjectModels/course.dart';
import '../Models/ProviderModel/courses_provider.dart';

import '../Models/ObjectModels/user.dart';
import '../Models/ProviderModel/user_provider.dart';
import '../Models/ProviderModel/course_learner_provider.dart';
import '../Models/ProviderModel/quiz_provider.dart';
import '../Models/ProviderModel/survey_provider.dart';
import 'Screens/course_review.dart';
import '../LessonPage/lesson_screen.dart';
import '../constants.dart';

class CourseItemScreen extends StatefulWidget {
  static const routeName = '/course_item';

  @override
  _CourseItemScreenState createState() => _CourseItemScreenState();
}

class _CourseItemScreenState extends State<CourseItemScreen> {
  Course _myCourse;
  User _user;
  bool _isLearningThisCourse;

  @override
  void initState() {
    _myCourse =
        Provider.of<CoursesProvider>(context, listen: false).selectedCourse;
    _user = Provider.of<UserProvider>(context, listen: false).user;
    super.initState();
  }

  void _getQuizAndSurveyForThisCurseLerner() {
    String courseLearnerId =
        Provider.of<CourseLearnerProvider>(context, listen: false)
            .curseLernerOfThisCourse(_user.id, _myCourse.id)
            .id;
    Provider.of<QuizProvider>(context, listen: false)
        .getQuizInCurseLearner(courseLearnerId, _user.token);
    Provider.of<SurveyProvider>(context, listen: false)
        .getSurveyInCourseLearner(courseLearnerId, _user.token);
  }

  void _showFirstLoginAlertDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Icon(
          Icons.warning_amber_rounded,
          color: Colors.yellow.shade700,
          size: 100,
        ),
        content: Text(
          'پێویستە لە پێشدا بچیتە ژوورەوە',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'باشە',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }


  void _addThisCourseToLearning() {
    if (_user == null) {
      _showFirstLoginAlertDialog();
      print('user is null');
      //  todo: show alarm to login
    } else {
      Provider.of<CourseLearnerProvider>(context, listen: false)
          .addCourseToLearning(_myCourse.id, _user.id, _user.token)
          .then((_) => setState(() {}));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      _isLearningThisCourse = false;
    } else {
      _isLearningThisCourse = Provider.of<CourseLearnerProvider>(context)
          .isLearningThisCourse(_user.id, _myCourse.id);
    }
    if (_isLearningThisCourse) _getQuizAndSurveyForThisCurseLerner();

    return Provider.of<CourseLearnerProvider>(context).isLoading
        ? progressPage()
        : _isLearningThisCourse
            ? LessonScreen()
            : CourseReview(_myCourse, _addThisCourseToLearning);
  }
}
