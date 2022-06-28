import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../Models/ObjectModels/book.dart';
import 'book_information.dart';
import 'audio_tab.dart';

class BookTabView extends StatelessWidget {
  final Book book;
  final bool isTextBook;

  BookTabView(this.book, this.isTextBook);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        SingleChildScrollView(child: BookInformation(book)),
        SingleChildScrollView(child: Html(data: book.brief)),
        if (!isTextBook) AudioTab(book.audioFiles),
      ],
    );
  }
}
