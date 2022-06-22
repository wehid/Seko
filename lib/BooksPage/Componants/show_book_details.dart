import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../Componants/show_video_book.dart';
import '../Componants/text_and_autdio_book.dart';
import '../../Models/ObjectModels/book.dart';
import '../../Models/ProviderModel/book_provider.dart';

class ShowBookDetails extends StatefulWidget {
  static const routeName = 'show-book-details';

  @override
  _ShowBookDetailsState createState() => _ShowBookDetailsState();
}

class _ShowBookDetailsState extends State<ShowBookDetails> {
  BookProvider bookProvider;
  Book book;

  @override
  void initState() {
    bookProvider = Provider.of<BookProvider>(context, listen: false);
    book = bookProvider.selectedBook;

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return book.type == VIDEO_BOOK_TYPE
        ? ShowVideoBook(book)
        : TextAndAudioBook(book);
  }
}
