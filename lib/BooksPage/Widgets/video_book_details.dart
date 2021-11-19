import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../constants.dart';
import '../../GlobalWidgets/youtube_video_item.dart';
import '../../GlobalWidgets/image_with_progress.dart';

import '../../Models/ObjectModels/book.dart';

class VideoBookDetails extends StatefulWidget {
  final Book videoBook;

  VideoBookDetails(this.videoBook);

  @override
  _VideoBookDetailsState createState() => _VideoBookDetailsState();
}

class _VideoBookDetailsState extends State<VideoBookDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("ڤیدیۆ"),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              flex: 30,
              child: Hero(
                tag: widget.videoBook.id + widget.videoBook.name,
                child: ImageWithProgress(widget.videoBook.smallImagePath),
              ),
            ),
            Expanded(
              flex: 70,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      widget.videoBook.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    YoutubeVideoItem(
                      YoutubePlayerController(
                        initialVideoId:
                            YoutubePlayer.convertUrlToId(widget.videoBook.link),
                        flags: YoutubePlayerFlags(
                          autoPlay: false,
                          controlsVisibleAtStart: true,
                        ),
                      ),
                    ),
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
