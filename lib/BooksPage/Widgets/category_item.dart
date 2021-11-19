import 'package:flutter/material.dart';

import '../../Models/ObjectModels/book_category.dart';

// TODO: this is for choos book category

class CategoryItem extends StatelessWidget {
  final BookCategory bookCategory;
  final Color color;
  final Function click;

  CategoryItem(this.bookCategory, this.color, this.click);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: click,
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: Image.asset(bookCategory.imagePath),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: color,
              child: Center(
                child: Text(bookCategory.name),
              ),
            ),
          )
        ],
      ),
    );
  }
}
