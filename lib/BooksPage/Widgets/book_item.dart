import 'package:flutter/material.dart';

import '../../Models/ObjectModels/book.dart';
import '../../GlobalWidgets/image_with_progress.dart';

class BookItem extends StatelessWidget {
  final Book book;
  final List categoryIcom = [
    null,
    Icons.library_books,
    Icons.video_collection,
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
        Text(
          book.name,
          overflow: TextOverflow.fade,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.5),
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 5,
            child: Stack(
              children: [
                ImageWithProgress(book.smallImagePath),
                Positioned(
                  bottom: 20,
                  right: 15,
                  child: Icon(
                    categoryIcom[int.parse(book.type)],
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            )),
        Expanded(flex: 4, child: _details()),
      ],
    );
  }
}
