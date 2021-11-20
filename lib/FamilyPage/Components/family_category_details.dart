import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ObjectModels/family_item.dart';
import '../../Models/ProviderModel/family_provider.dart';
import '../../Models/ObjectModels/family_category.dart';
import '../Widgets/family_item_widget.dart';
import '../../constants.dart';

class FamilyCategoryDetails extends StatelessWidget {
  static const String routeName = '/category-details';

  @override
  Widget build(BuildContext context) {
    final FamilyProvider familyProvider =
        Provider.of<FamilyProvider>(context, listen: false);
    final FamilyCategory selectedCategory =
        familyProvider.selectedFamilyCategory;
    final List<FamilyItem> familyItemList =
        familyProvider.getFamilyItemListWithCategoryId(selectedCategory.id);

    return Scaffold(
      appBar: customAppBar(selectedCategory.title),
      body: ListView.builder(
        itemCount: familyItemList.length,
        itemBuilder: (context, index) {
          return FamilyItemWidget(familyItemList[index]);
        },
      ),
    );
  }
}
