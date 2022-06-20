import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ObjectModels/family_item.dart';
import '../../GlobalWidgets/image_with_progress.dart';
import '../../Models/ProviderModel/family_provider.dart';
import '../Components/family_item_details.dart';
import '../../constants.dart';

class FamilyItemWidget extends StatelessWidget {
  final FamilyItem familyItem;

  FamilyItemWidget(this.familyItem);

  void _openFamilyItem(BuildContext context) {
    Provider.of<FamilyProvider>(context, listen: false)
        .setSelectedFamilyItem(familyItem);
    Navigator.of(context).pushNamed(FamilyItemDetails.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openFamilyItem(context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            if (familyItem.smallImagePath != "")
              Expanded(
                flex: 4,
                child: ImageWithProgress(familyItem.smallImagePath),
              ),
            if (familyItem.smallImagePath == "" &&
                familyItem.type == FAMILY_POSTER_TYPE)
              Expanded(
                flex: 4,
                child: ImageWithProgress(familyItem.filePath),
              ),
            const SizedBox(height: 10),
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  Text(
                    familyItem.title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
