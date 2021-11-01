import 'package:flutter/material.dart';

import '../../Models/ObjectModels/course.dart';
class CourseImage extends StatelessWidget {
  final Course course;

  CourseImage(this.course);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      child: Hero(
        tag: course.id,
        child: course.smallImagePath.length == 0
            ? Image.asset("assets/images/ferkary.jpg")
            : Image.network(
                course.smallImagePath,
                fit: BoxFit.fill,
                //show progress bar for image loading
                loadingBuilder:
                    (BuildContext context, Widget child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Stack(
                    children: [
                      Center(
                        child: Text(
                            '${loadingProgress.expectedTotalBytes != null ? ((loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes) * 100).toStringAsFixed(0) : null} %'),
                      ),
                      Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes
                              : null,
                        ),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
