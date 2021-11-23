import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoItem extends StatefulWidget {
  final YoutubePlayerController controller;


  YoutubeVideoItem(this.controller);

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
        builder: (context, player){
          return player;
        },
      ),
    );
  }
}
