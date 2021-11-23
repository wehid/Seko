import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageWithProgress extends StatelessWidget {
  final String imagePath;

  ImageWithProgress(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imagePath,
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

  /// this is take image with image network

  // @override
  // Widget build(BuildContext context) {
  //   return Image.network(
  //     imagePath,
  //     fit: BoxFit.fill,
  //     //show progress bar for image loading
  //     loadingBuilder: (BuildContext context, Widget child, loadingProgress) {
  //       if (loadingProgress == null) {
  //         return child;
  //       }
  //       return Stack(
  //         children: [
  //           Center(
  //             child: Text(
  // '${loadingProgress.expectedTotalBytes != null ? ((loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes) * 100).toStringAsFixed(0) : null} %'),
  //           ),
  //           Center(
  //             child: CircularProgressIndicator(
  //               value: loadingProgress.expectedTotalBytes != null
  //                   ? loadingProgress.cumulativeBytesLoaded /
  //                       loadingProgress.expectedTotalBytes
  //                   : null,
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
