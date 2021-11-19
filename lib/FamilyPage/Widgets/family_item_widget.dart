import 'package:flutter/material.dart';

import '../../Models/ObjectModels/family_item.dart';
import '../../GlobalWidgets/image_with_progress.dart';

class FamilyItemWidget extends StatelessWidget {
  final FamilyItem familyItem;

  FamilyItemWidget(this.familyItem);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Column(
              children: [
                Text(
                  familyItem.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  familyItem.createDate,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
                ),
              ],
            ),
          ),
          if (familyItem.smallImagePath != "")
            Expanded(
              flex: 4,
              child: ImageWithProgress(familyItem.smallImagePath),
            ),
        ],
      ),
    );
  }
}
