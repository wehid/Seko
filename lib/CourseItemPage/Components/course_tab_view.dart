import 'package:flutter/material.dart';

import '../../Models/ObjectModels/course.dart';
import '../../GlobalWidgets/youtube_video_item.dart';
import 'course_cataloge.dart';

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

  String _makeYoutubeUrl(String url) {
    // youtube video in this part back in formate "https://youtu.be/weDVEn0u7EY"
    // and i have to change it to standard format

    String videoId = url.split('/').last;
    print("the video id is: $videoId");
    return "https://www.youtube.com/watch?v=$videoId";
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
                    child: YoutubeVideoItem(_makeYoutubeUrl(myCourse.videoUrl)),
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
