import 'package:flutter/material.dart';

import '../../Models/ObjectModels/book.dart';
import '../../constants.dart';
import '../../GlobalWidgets/youtube_video_item.dart';

class ShowVideoBook extends StatelessWidget {
  final Book videoBook;

  ShowVideoBook(this.videoBook);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("ڤیدیۆ"),
      body: Center(
        child: YoutubeVideoItem(
          // youtube video in this part back in formate "https://youtu.be/weDVEn0u7EY"
          // and i have to change it to standard format
          makeYoutubeUrlFromYoutubeBe(videoBook.link),
        ),
      ),
    );
  }
}
