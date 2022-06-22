import 'package:flutter/material.dart';

import '../../Models/ObjectModels/book.dart';
import '../../constants.dart';

class BookItemSummary extends StatelessWidget {
  final Book book;

  BookItemSummary(this.book);

  @override
  Widget build(BuildContext context) {
    final _backColor = getColorCode(book.backColor);
    final _textColor = _backColor == Colors.white
        ? Colors.black
        : getColorCode(book.foreColor);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
      decoration: BoxDecoration(
        color: _backColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                BOOK_CATEGORY_ICON[int.parse(book.type)],
                color: _textColor,
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  book.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: _textColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            "نووسەر: ${book.author}",
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: TextStyle(
              fontSize: 13,
              color: _textColor,
            ),
          ),
          Text(
            "زمانی نووسین: ${book.mainLanguageTitle}",
            style: TextStyle(
              fontSize: 13,
              color: _textColor,
            ),
          ),
        ],
      ),
    );
  }
}
