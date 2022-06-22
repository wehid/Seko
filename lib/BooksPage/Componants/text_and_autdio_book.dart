import 'package:flutter/material.dart';

import '../../Models/ObjectModels/book.dart';
import '../../GlobalWidgets/image_with_progress.dart';
import '../Widgets/book_tab_bar.dart';
import '../Widgets/book_tab_view.dart';
import '../../constants.dart';

class TextAndAudioBook extends StatelessWidget {
  final Book book;

  TextAndAudioBook(this.book);

  bool _isTextBook() {
    return book.type == TEXT_BOOK_TYPE;
  }

  String _AppBarTitle() {
    return _isTextBook() ? 'کتێب / تێکست' : 'دەنگەکتێب';
  }

  Widget header() {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: Hero(
            tag: book.id + book.name,
            child: ImageWithProgress(book.smallImagePath),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Spacer(),
            Icon(
              BOOK_CATEGORY_ICON[int.parse(book.type)],
              color: Colors.grey.shade600,
            ),
            const SizedBox(width: 10),
            Text(
              book.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final int numberOfTab = _isTextBook() ? 2 : 3;

    return DefaultTabController(
      initialIndex: 0,
      length: numberOfTab,
      child: Scaffold(
        appBar: customAppBar(_AppBarTitle()),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              header(),
              const SizedBox(height: 20),
              BookTabBar(_isTextBook()),
              Expanded(child: BookTabView(book, _isTextBook()))
            ],
          ),
        ),
      ),
    );
  }
}
