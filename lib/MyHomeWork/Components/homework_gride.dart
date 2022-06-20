import 'package:flutter/material.dart';

import '../../Models/ObjectModels/user_item_file.dart';
import '../Widgets/homework_widget.dart';

class HomeworkGride extends StatelessWidget {
  final List<UserItemFile> homeworks;

  HomeworkGride(this.homeworks);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: homeworks.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 280 / 400,
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {
        return HomeworkWidget(homeworks[index]);
      },
    );
  }
}
