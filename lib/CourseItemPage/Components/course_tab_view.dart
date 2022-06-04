import 'package:flutter/material.dart';

import '../../Models/ObjectModels/course.dart';
import '../../GlobalWidgets/youtube_video_item.dart';
import 'course_cataloge.dart';
import '../../constants.dart';

class CourseTabView extends StatelessWidget {
  final Course myCourse;

  CourseTabView(this.myCourse);

  Widget _myDiscription(String discription) {
    return Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: Center(
        child: Text(
          discription,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.blue.shade600),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TabBarView(
        children: [
          SingleChildScrollView(child: CourseCataloge(myCourse)),
          SingleChildScrollView(
            child: myCourse.videoUrl.length > 10
                ? Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: YoutubeVideoItem(makeYoutubeUrlFromYoutubeBe(myCourse.videoUrl)),
                  )
                : _myDiscription("ڤیدیۆی ناساندن بەردەست نییە"),
          ),
          SingleChildScrollView(
            child: _myDiscription(myCourse.startDate),
          ),
        ],
      ),
    );
  }
}
