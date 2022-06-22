import 'package:flutter/material.dart';

import '../../Models/ObjectModels/family_item.dart';
import '../Widgets/family_item_widget.dart';

class FamilyItemLlistShow extends StatelessWidget {
  final List<FamilyItem> familyItemList;
  final String typeTitle;

  FamilyItemLlistShow(this.familyItemList, this.typeTitle);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                typeTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
            ],
          ),
          const Divider(thickness: 1, color: Colors.grey),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: familyItemList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 220 / 300,
            ),
            itemBuilder: (context, index) {
              return FamilyItemWidget(familyItemList[index]);
            },
          ),
        ],
      ),
    );
  }
}
