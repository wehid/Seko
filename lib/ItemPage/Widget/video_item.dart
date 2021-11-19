import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoItem extends StatefulWidget {
  final VideoPlayerController videoPlayerController;

  VideoItem(this.videoPlayerController);

  @override
  _VideoItemState createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  ChewieController _chewieController;

  @override
  void dispose() {
    _chewieController.dispose();
    widget.videoPlayerController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16/9,
      autoInitialize: true,
      errorBuilder: (context, errorMessage){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              errorMessage,
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(8.0),
      child: Chewie(controller: _chewieController),
    );
  }
}
