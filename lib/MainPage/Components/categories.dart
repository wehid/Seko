import 'package:flutter/material.dart';

import '../../constants.dart';
import '../Components/dropdown_categories.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'نیشاندانی پۆلێنی: ',
            textAlign: TextAlign.start,
            style: titleTextStyle(),
          ),
          // const SizedBox(width: 5),
          Expanded(child: Center(child: DropdownCategories())),
        ],
      ),
    );
  }
}
