import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ObjectModels/lesson.dart';
import '../../Models/ProviderModel/lesson_provider.dart';
import '../../ItemPage/item_screen.dart';

class LessonItem extends StatelessWidget {
  final Lesson lesson;


  LessonItem(this.lesson);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(lesson.title),
      subtitle: Text('${lesson.courseName} : ${lesson.weekName}'),
      onTap: (){
        Provider.of<LessonProvider>(context, listen: false).setSelectedLesson(lesson);
        Navigator.of(context).pushNamed(ItemScreen.routeName);
      },
    );
  }
}
