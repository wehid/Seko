import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Models/ProviderModel/courses_provider.dart';
import '../../GlobalWidgets/seko_text_form_field.dart';

class SearchInCourses extends StatefulWidget {
  @override
  _SearchInCoursesState createState() => _SearchInCoursesState();
}

class _SearchInCoursesState extends State<SearchInCourses> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: SekoTextFormField(
        label: "لێرە بگەڕێ",
        onChange: (value) {
          Provider.of<CoursesProvider>(context, listen: false)
              .showCoursesWithWord(value);
        },
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
