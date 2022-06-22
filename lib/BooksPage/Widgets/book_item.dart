import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ObjectModels/book.dart';
import '../../Models/ProviderModel/book_provider.dart';
import '../../GlobalWidgets/image_with_progress.dart';
import '../Componants/show_book_details.dart';
import 'book_item_summary.dart';
import '../../constants.dart';

class BookItem extends StatelessWidget {
  final Book book;
  BookItem(this.book);

  Widget _bookImageWidget(String imagePath) {
    return Expanded(
      flex: 5,
      child: Hero(
        tag: book.id + book.name,
        child: ImageWithProgress(book.smallImagePath),
      ),
    );
  }

  void _openBookDetails(BuildContext context) {
    Provider.of<BookProvider>(context, listen: false).setSelectedBook(book);
    Navigator.of(context).pushNamed(ShowBookDetails.routeName);
  }

  bool _isVideoBook(Book book) {
    return book.type == VIDEO_BOOK_TYPE;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openBookDetails(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        margin: const EdgeInsets.only(top: 3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Column(
          children: [
            book.smallImagePath != ""
                ? _bookImageWidget(book.smallImagePath)
                : _isVideoBook(book)
                    ? Image.asset("assets/images/book-video.jpg")
                    : Image.asset("assets/images/seko-logo.png"),
            const SizedBox(height: 8),
            Expanded(flex: 4, child: BookItemSummary(book)),
          ],
        ),
      ),
    );
  }
}
