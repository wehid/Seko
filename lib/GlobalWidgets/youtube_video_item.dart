import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoItem extends StatefulWidget {
  YoutubePlayerController controller;

  YoutubeVideoItem(String youtubeVideoUrl) {
    this.controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(youtubeVideoUrl),
      flags: YoutubePlayerFlags(
        autoPlay: false,
        controlsVisibleAtStart: true,
      ),
    );
  }

  @override
  _YoutubeVideoItemState createState() => _YoutubeVideoItemState();
}

class _YoutubeVideoItemState extends State<YoutubeVideoItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: widget.controller,
        ),
        builder: (context, player) {
          return player;
        },
      ),
    );
  }
}
