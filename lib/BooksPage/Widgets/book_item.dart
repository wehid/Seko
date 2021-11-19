import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ObjectModels/book.dart';
import '../../Models/ProviderModel/book_provider.dart';
import '../../GlobalWidgets/image_with_progress.dart';
import 'show_book_details.dart';
import '../../constants.dart';

class BookItem extends StatelessWidget {
  final Book book;


  BookItem(this.book);

  Widget _details() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          book.userName,
          style: TextStyle(
            color: Colors.grey.shade500,
          ),
        ),
        Row(
          children: [
            Icon(
              BOOK_CATEGORY_ICON[int.parse(book.type)],
              color: Colors.grey.shade600,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                book.name,
                overflow: TextOverflow.fade,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ],
        ),
        Text(
          book.createDate,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  void _openBookDetails(BuildContext context) {
    Provider.of<BookProvider>(context, listen: false).setSelectedBook(book);
    Navigator.of(context).pushNamed(ShowBookDetails.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openBookDetails(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 5,
              child: Hero(
                  tag: book.id + book.name,
                  child: ImageWithProgress(book.smallImagePath))),
          Expanded(flex: 4, child: _details()),
        ],
      ),
    );
  }
}
