import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../constants.dart';
import '../../GlobalWidgets/youtube_video_item.dart';
import '../../GlobalWidgets/image_with_progress.dart';
import '../../GlobalWidgets/outline_linke.dart';

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
  String appBarTitle;
  List<Widget> exclusiveWidgets;

  @override
  void initState() {
    bookProvider = Provider.of<BookProvider>(context, listen: false);
    book = bookProvider.selectedBook;
    appBarTitle = setAppBarTitle(book);
    exclusiveWidgets = setExclusiveWidgets(book);

    super.initState();
  }

  setAppBarTitle(Book book) {
    switch (book.type) {
      case TEXT_BOOK_TYPE:
        return 'کتێب / تێکست';
        break;
      case VIDEO_BOOK_TYPE:
        return 'ڤیدیۆ';
        break;
      case AUDIO_BOOK_TYPE:
        return 'دەنگەکتێب';
        break;
    }
  }

  setExclusiveWidgets(Book book) {
    switch (book.type) {
      case TEXT_BOOK_TYPE:
        return textBookWidgets();
        break;
      case VIDEO_BOOK_TYPE:
        return videoBookWidgets();
        break;
      case AUDIO_BOOK_TYPE:
        return audioBookWidgets();
        break;
    }
  }

  List<Widget> videoBookWidgets() {
    return [
      YoutubeVideoItem(
        book.link
      ),
    ];
  }

  List<Widget> audioBookWidgets() {
    return [
      Html(data: book.brief),
    ];
  }

  List<Widget> textBookWidgets() {
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Html(data: book.brief),
      ),
      OutlineLink(
        icon: CupertinoIcons.link,
        description: "بەستەری دەرەکی",
        link: book.link,
      ),
      OutlineLink(
        icon: CupertinoIcons.paperclip,
        description: "دابەزێنە",
        link: book.filePath,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(appBarTitle),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              flex: 30,
              child: Hero(
                tag: book.id + book.name,
                child: ImageWithProgress(book.smallImagePath),
              ),
            ),
            Expanded(
              flex: 70,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          BOOK_CATEGORY_ICON[int.parse(book.type)],
                          color: Colors.grey.shade600,
                        ),
                        Expanded(
                          child: Text(
                            book.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    ...exclusiveWidgets,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
