import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoItem extends StatefulWidget {

  // TODO: FIND BETER SOLUTION FOR THIS

  YoutubePlayerController controller;

  YoutubeVideoItem(String youtubeVideoUrl) {
    this.controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId("https:$youtubeVideoUrl"),
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
