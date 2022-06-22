import 'package:flutter/material.dart';

import '../../Models/ObjectModels/book.dart';

class BookInformation extends StatelessWidget {
  final Book book;
  BookInformation(this.book);

  Widget singlRowInformation(String title, String description) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              const SizedBox(width: 10),
              Text(
                description,
                style: TextStyle(
                    color: Colors.red.shade500,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const SizedBox(
              width: 300, child: const Divider(color: Colors.blueGrey)),
        ],
      ),
    );
  }

  bool _itemNotEmpty(String item) {
    return (item != "" && item != null);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        singlRowInformation("نووسینی: ", book.author),
        singlRowInformation("زمانی نووسین: ", book.mainLanguageTitle),
        if (_itemNotEmpty(book.translator))
          singlRowInformation("وەرگێڕ: ", book.translator),
        if (_itemNotEmpty(book.transLanguageTitle))
          singlRowInformation("زمانی وەرگێڕان: ", book.transLanguageTitle),
      ],
    );
  }
}
