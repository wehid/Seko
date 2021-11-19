import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ObjectModels/family_item.dart';
import '../../Models/ProviderModel/family_provider.dart';
import '../../Models/ObjectModels/family_category.dart';
import '../Widgets/family_item_widget.dart';
import '../../constants.dart';

class FamilyCategoryDetails extends StatelessWidget {
  static const String routeName = '/category-details';

  List<FamilyItem> familyItemList;
  FamilyCategory selectedCategory;

  @override
  Widget build(BuildContext context) {
    final FamilyProvider familyProvider =
        Provider.of<FamilyProvider>(context, listen: false);
    selectedCategory = familyProvider.selectedFamilyCategory;
    familyItemList =
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
