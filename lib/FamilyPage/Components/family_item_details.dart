import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ProviderModel/family_provider.dart';
import '../../Models/ObjectModels/family_item.dart';
import '../../constants.dart';
import '../../GlobalWidgets/image_with_progress.dart';
import '../../GlobalWidgets/outline_linke.dart';

class FamilyItemDetails extends StatelessWidget {
  static const String routeName = '/family-item-details';

  @override
  Widget build(BuildContext context) {
    print('this is family item widget');

    final FamilyItem familyItem =
        Provider.of<FamilyProvider>(context, listen: false).selectedFamilyItem;

    return Scaffold(
      appBar: customAppBar(familyItem.familyCatName),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            if (familyItem.smallImagePath != "")
              Expanded(
                flex: 3,
                child: ImageWithProgress(familyItem.smallImagePath),
              ),
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    familyItem.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  OutlineLink(
                    icon: CupertinoIcons.link,
                    description: "بەستەری دەرەکی",
                    link: familyItem.link,
                  ),
                  OutlineLink(
                    icon: CupertinoIcons.paperclip,
                    description: "دابەزێنە",
                    link: familyItem.filePath,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
