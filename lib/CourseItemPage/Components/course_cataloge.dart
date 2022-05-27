import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../Models/ObjectModels/course.dart';
import '../../Models/ProviderModel/lesson_provider.dart';

class CourseCataloge extends StatelessWidget {
  final Course myCourse;

  CourseCataloge(this.myCourse);

  @override
  Widget build(BuildContext context) {
    final LessonProvider lessonProvider =
        Provider.of<LessonProvider>(context, listen: false);

    final _myLessons = lessonProvider.lessonList;

    return Column(
      children: [
        Html(data: '${myCourse.topics}'),
        ..._myLessons.map(
          (lesson) => Column(
            children: [
              Text(
                "> ${lesson.title}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Divider(color: Colors.black),
              Column(
                children: [
                  ...lesson.items.map(
                    (item) => Row(
                      children: [
                        const SizedBox(
                          width: 35,
                        ),
                        Icon(
                          itemIcon(item),
                          color: Colors.grey,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ],
    );
  }
}
