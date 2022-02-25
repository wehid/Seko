import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Models/ProviderModel/courses_provider.dart';

enum sortType {
  earlyToLast,
  lastToEarly,
}

class SortByDate extends StatefulWidget {
  @override
  _SortByDateState createState() => _SortByDateState();
}

class _SortByDateState extends State<SortByDate> {
  sortType _value = sortType.earlyToLast;
  CoursesProvider _coursesProvider;
  final items = ["کۆن بۆ تازە", "تازە بۆ کۆن"];

  Text dropdownText(String title) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  @override
  void initState() {
    super.initState();
    _coursesProvider = Provider.of<CoursesProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        dropdownText("ڕیزبەندی کۆرسەکان: "),
        Expanded(
          child: Center(
            child: DropdownButton<sortType>(
              elevation: 2,
              value: _value,
              icon: const Icon(Icons.arrow_downward_outlined),
              iconSize: 20,
              onChanged: (sortType newSort) {
                setState(() {
                  if (newSort == sortType.earlyToLast) {
                    _coursesProvider.showAllCourse();
                    _value = sortType.earlyToLast;
                  } else {
                    _coursesProvider.showCoursesReverse();
                    _value = sortType.lastToEarly;
                  }
                });
              },
              items: [
                DropdownMenuItem(
                  child: dropdownText("تازه بۆ کۆن"),
                  value: sortType.earlyToLast,
                ),
                DropdownMenuItem(
                  child: dropdownText("کۆن بۆ تازە"),
                  value: sortType.lastToEarly,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
