import 'package:flutter/material.dart';

import '../../Models/ObjectModels/family_category.dart';

class FamilyCategoryWidget extends StatelessWidget {
  final FamilyCategory familyCategory;

  FamilyCategoryWidget(this.familyCategory);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(familyCategory.title),
      ),
    );
  }
}
