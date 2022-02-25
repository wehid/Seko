import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'categories.dart';
import 'courses.dart';
import 'search_in_courses.dart';
import 'sort_by_date.dart';
import 'show_courses_by_team.dart';
import '../../Models/ProviderModel/courses_provider.dart';
import '../../Models/ObjectModels/course.dart';

class LearningTab extends StatefulWidget {
  @override
  _LearningTabState createState() => _LearningTabState();
}

class _LearningTabState extends State<LearningTab> {
  bool _showSearch = false;
  bool _showFilter = false;
  final Duration _myDuration = Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    final CoursesProvider _coursesProvider =
        Provider.of<CoursesProvider>(context);

    final List<Course> _coursesList = _coursesProvider.courseList;

    return Scaffold(
      appBar: AppBar(
        title: Text("هۆبەی ڕاهێزان"),
        actions: [
          Image.asset("assets/images/krg_logo.png"),
          IconButton(
              onPressed: () {
                setState(() {
                  _showFilter = false;
                  _showSearch = !_showSearch;
                });
              },
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                setState(() {
                  _showSearch = false;
                  _showFilter = !_showFilter;
                });
              },
              icon: Icon(Icons.filter_alt_sharp)),
        ],
      ),
      body: Column(
        children: [
          AnimatedContainer(
            duration: _myDuration,
            child: SearchInCourses(),
            height: _showSearch ? 80 : 0,
          ),
          AnimatedContainer(
            margin: EdgeInsets.all(10),
            color: Colors.white,
            duration: _myDuration,
            height: _showFilter ? 150 : 0,
            child: Center(
              child: ListView(
                children: [
                  Categories(),
                  ShowCoursesByTeam(),
                  SortByDate(),
                ],
              ),
            ),
          ),
          Expanded(child: Courses(_coursesList)),
        ],
      ),
    );
  }
}
