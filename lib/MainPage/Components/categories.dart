import 'package:flutter/material.dart';

import '../../constants.dart';
import '../Components/dropdown_categories.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'نیشاندانی پۆلێنی: ',
          style: titleTextStyle(),
        ),
        // DropdownCategories(),
        Expanded(child: Center(child: DropdownCategories())),
      ],
    );
  }
}
