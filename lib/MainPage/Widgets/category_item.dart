import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ObjectModels/category.dart';
import '../../Models/ProviderModel/category_provider.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Provider.of<CategoryProvider>(context, listen: false).setSelectedCategory(category);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 140,
        width: 140,
        child: Column(
          children: [
            Flexible(
              flex: 4,
              child: Image.asset(
                'assets/images/ferkary.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Flexible(
              flex: 1,
              child: Text(
                category.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
