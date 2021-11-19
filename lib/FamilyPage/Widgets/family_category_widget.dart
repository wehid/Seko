import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ObjectModels/family_category.dart';
import '../../Models/ProviderModel/family_provider.dart';
import '../../GlobalWidgets/image_with_progress.dart';
import '../Components/family_category_details.dart';

class FamilyCategoryWidget extends StatelessWidget {
  final FamilyCategory familyCategory;

  FamilyCategoryWidget(this.familyCategory);

  Color _getColorCode(String colorString) {
    return Color(int.parse("0xff$colorString"));
  }

  void _openCategory(BuildContext context) {
    Provider.of<FamilyProvider>(context, listen: false)
        .setSelectedFamilyCategory(familyCategory);

        Navigator.of(context).pushNamed(FamilyCategoryDetails.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openCategory(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: _getColorCode(familyCategory.backColor),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140,
              child: Hero(
                tag: familyCategory.id + familyCategory.title,
                child: ImageWithProgress(familyCategory.smallImagePath),
              ),
            ),
            Text(
              familyCategory.title,
              textAlign: TextAlign.right,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 17,
                color: _getColorCode(familyCategory.foreColor),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  familyCategory.introduction,
                  style: TextStyle(
                      fontSize: 12,
                      color: _getColorCode(familyCategory.foreColor)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
