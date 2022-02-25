import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ProviderModel/courses_provider.dart';

enum teamType {
  all,
  team,
  alone,
}

class ShowCoursesByTeam extends StatefulWidget {
  @override
  _ShowCoursesByTeamState createState() => _ShowCoursesByTeamState();
}

class _ShowCoursesByTeamState extends State<ShowCoursesByTeam> {
  teamType _value = teamType.all;
  CoursesProvider _coursesProvider;

  Text dropdownText(String title) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  @override
  void initState() {
    _coursesProvider = Provider.of<CoursesProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        dropdownText("شێوەی خوێندن: "),
        Expanded(
          child: Center(
            child: DropdownButton<teamType>(
              elevation: 2,
              value: _value,
              icon: const Icon(Icons.arrow_downward_outlined),
              iconSize: 20,
              onChanged: (teamType newType) {
                setState(() {
                  if (newType == teamType.all) {
                    _coursesProvider.showAllCourse();
                    _value = teamType.all;
                  } else if (newType == teamType.team) {
                    _coursesProvider.showTeamCourses();
                    _value = teamType.team;
                  } else {
                    _coursesProvider.showAloneCourses();
                    _value = teamType.alone;
                  }
                });
              },
              items: [
                DropdownMenuItem(
                  child: dropdownText("هەموو خولەکان"),
                  value: teamType.all,
                ),
                DropdownMenuItem(
                  child: dropdownText("بە تاک"),
                  value: teamType.alone,
                ),
                DropdownMenuItem(
                  child: dropdownText("بە گروپ"),
                  value: teamType.team,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
