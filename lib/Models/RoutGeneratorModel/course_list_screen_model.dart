import '../ObjectModels/course.dart';

class CourseListScreenModel {
  List<Course> courseList;
  String pageTitle;
  bool isFromCategory;

  CourseListScreenModel({
    this.courseList,
    this.pageTitle,
    this.isFromCategory = false,
  });
}
