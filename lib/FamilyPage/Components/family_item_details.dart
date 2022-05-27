import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ProviderModel/family_provider.dart';
import '../../Models/ObjectModels/family_item.dart';
import '../../constants.dart';
import '../../GlobalWidgets/image_with_progress.dart';
import '../../GlobalWidgets/internal_video_item.dart';
import '../../GlobalWidgets/pdf_view.dart';

class FamilyItemDetails extends StatelessWidget {
  static const String routeName = '/family-item-details';

  @override
  Widget build(BuildContext context) {
    final FamilyItem familyItem =
        Provider.of<FamilyProvider>(context, listen: false).selectedFamilyItem;

    return Scaffold(
      appBar: customAppBar(familyItem.familyCatName),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            if (familyItem.type == familyVideoType)
              InternalVideoItem(familyItem.filePath),
            if (familyItem.type == familyPosterType)
              ImageWithProgress(familyItem.filePath),
            if (familyItem.type == familyTextType)
              Expanded(child: PdfView(familyItem.filePath)),
          ],
        ),
      ),
    );
  }
}
