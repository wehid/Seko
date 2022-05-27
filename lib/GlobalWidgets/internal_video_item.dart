import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class InternalVideoItem extends StatefulWidget {
  VideoPlayerController videoPlayerController;
  final String videoPath;

  InternalVideoItem(this.videoPath){
    videoPlayerController = VideoPlayerController.network(videoPath);
  }

  @override
  _InternalVideoItemState createState() => _InternalVideoItemState();
}

class _InternalVideoItemState extends State<InternalVideoItem> {
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
        aspectRatio: 16 / 9,
        autoInitialize: true,
        errorBuilder: (context, errorMessage) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                errorMessage,
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        });
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
