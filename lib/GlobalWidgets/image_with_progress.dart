import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageWithProgress extends StatelessWidget {
  final String imagePath;

  ImageWithProgress(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imagePath,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (_, url, DownloadProgress progress) {
        if (progress == null) return null;
        return Stack(
          children: [
            Center(
              child: progress.progress != null
                  ? Text(
                      '${(progress.progress * 100).toStringAsFixed(0)} %',
                    )
                  : null,
            ),
            Center(
              child: CircularProgressIndicator(
                value: progress.progress,
              ),
            ),
          ],
        );
      },
    );
  }
}
