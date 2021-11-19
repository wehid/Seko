import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'categories.dart';
import 'courses.dart';
import '../../constants.dart';
import '../../Models/ProviderModel/courses_provider.dart';
import '../../Models/ProviderModel/category_provider.dart';
import '../../Models/ObjectModels/course.dart';
import '../../Models/ObjectModels/category.dart';

class LearningTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CoursesProvider _coursesProvider =
        Provider.of<CoursesProvider>(context);
    final CategoryProvider _categoryProvider =
        Provider.of<CategoryProvider>(context);
    final Category _selectedCategory = _categoryProvider.selectedCategory;
    final List<Course> _coursesList = _categoryProvider.selectedCategory == null
        ? _coursesProvider.courseList
        : _coursesProvider
            .getCourseListBySelectedCategoryId(_selectedCategory.id);

    return Scaffold(
      appBar: customAppBar("هۆبەی ڕاهێزان"),
      body: Column(
        children: [
          Container(
            height: 45,
            child: Center(child: Categories()),
          ),
          const Divider(thickness: 2),
          Expanded(child: Courses(_coursesList)),
        ],
      ),
    );
  }
}
