import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ObjectModels/family_item.dart';
import '../../Models/ProviderModel/family_provider.dart';
import '../../Models/ObjectModels/family_category.dart';
import '../../constants.dart';
import 'family_item_list_show.dart';

class FamilyCategoryDetails extends StatelessWidget {
  static const String routeName = '/category-details';

  @override
  Widget build(BuildContext context) {
    final FamilyProvider familyProvider =
        Provider.of<FamilyProvider>(context, listen: false);
    final FamilyCategory selectedCategory =
        familyProvider.selectedFamilyCategory;
    final List<FamilyItem> familyVideoItemList =
        familyProvider.getFamilyItemListWithCategoryIdAndType(
            selectedCategory.id, FAMILY_VIDEO_TYPE);
    final List<FamilyItem> familyTextItemList =
        familyProvider.getFamilyItemListWithCategoryIdAndType(
            selectedCategory.id, FAMILY_TEXT_TYPE);
    final List<FamilyItem> familyPosterItemList =
        familyProvider.getFamilyItemListWithCategoryIdAndType(
            selectedCategory.id, FAMILY_POSTER_TYPE);

    return Scaffold(
      appBar: customAppBar(selectedCategory.title),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              if (familyVideoItemList.length > 0)
                FamilyItemLlistShow(familyVideoItemList, "ڤیدیۆ"),
              if (familyTextItemList.length > 0)
                FamilyItemLlistShow(familyTextItemList, "نامیلکه"),
              if (familyPosterItemList.length > 0)
                FamilyItemLlistShow(familyPosterItemList, "پۆستەر"),
            ],
          ),
        ),
      ),
    );
  }
}
