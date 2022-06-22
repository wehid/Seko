import 'package:flutter/material.dart';

import '../../Models/ObjectModels/user_item_file.dart';
import '../../GlobalWidgets/image_with_progress.dart';
import '../../GlobalWidgets/user_circle_avatar.dart';
import '../../constants.dart';

class HomeworkWidget extends StatelessWidget {
  final UserItemFile itemFile;

  HomeworkWidget(this.itemFile);

  String _courseImagePath() {
    return "https://$BASE_URL/files/p1/courses/${itemFile.courseSmallImage}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(
            child: ImageWithProgress(_courseImagePath()),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${itemFile.learnerName} ${itemFile.learnerFamily}",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                ),
                Text(
                  "${itemFile.courseName} => ${itemFile.itemName}",
                  style: TextStyle(color: Colors.blue),
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                ),
                Text(itemFile.file),
              ],
            ),
          )
        ],
      ),
    );
  }
}
