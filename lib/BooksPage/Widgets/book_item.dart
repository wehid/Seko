import 'package:flutter/material.dart';

import '../../constants.dart';

import '../../Models/ObjectModels/book.dart';
import '../../GlobalWidgets/image_with_progress.dart';
import 'text_book_details.dart';
import 'video_book_details.dart';

class BookItem extends StatelessWidget {
  final Book book;
  final List categoryIcom = [
    null,
    Icons.library_books,
    Icons.videocam,
    Icons.headphones
  ];

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
              categoryIcom[int.parse(book.type)],
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
    switch (book.type) {
      case TEXT_BOOK_TYPE:
        Navigator.push(context,
            MaterialPageRoute(builder: (ctx) => TextBookDetails(book)));
        break;
      case VIDEO_BOOK_TYPE:
        Navigator.push(context,
            MaterialPageRoute(builder: (ctx) => VideoBookDetails(book)));
        break;
    }
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
