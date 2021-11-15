import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../Models/ObjectModels/family_category.dart';
import '../Models/ProviderModel/family_provider.dart';
import 'Widgets/family_category_widget.dart';

class FamilyScreen extends StatelessWidget {
  bool _isFirstRun = true;

  void loadCategories(BuildContext context) {
    Provider.of<FamilyProvider>(context, listen: false)
        .getAllFamilyCategories();
    _isFirstRun = false;
  }

  @override
  Widget build(BuildContext context) {
    if (_isFirstRun) {
      loadCategories(context);
    }
    FamilyProvider familyProvider = Provider.of<FamilyProvider>(context);
    List<FamilyCategory> familyCategories = familyProvider.familyCategories;
    bool _isLoading = familyProvider.isLoading;

    return Scaffold(
      appBar: customAppBar('گەنجینەی خێزان'),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              itemCount: familyCategories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                crossAxisCount: 2,
                childAspectRatio: 280 / 400,
              ),
              itemBuilder: (_, index) {
                return FamilyCategoryWidget(familyCategories[index]);
              },
            ),
    );
  }
}
