import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'item_header.dart';
import '../../GlobalWidgets/internal_video_item.dart';
import '../../GlobalWidgets/youtube_video_item.dart';
import '../../GlobalWidgets/html_view.dart';
import '../../Models/ObjectModels/item.dart';
import '../../QuizFragment/quiz_fragment.dart';
import '../../constants.dart';
import '../../SurveyFragment/survey_fragment.dart';
import '../../ItemCommentFragment/item_comment_fragment.dart';

class SingleItem extends StatelessWidget {
  static const _ITEM_CAN_HAVE_COMMENT = "2";
  final Item item;

  SingleItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            ItemHeader(item),
            if (item.videoPath.length > 0) InternalVideoItem(item.videoPath),
            //video url have http:// as default because that must be >10
            if (item.videoUrl.length > 10) YoutubeVideoItem(item.videoUrl),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: HtmlView(item.contents),
            ),
            if (int.parse(item.type) == QUESTION_TYPE) QuizFragment(item.id),
            if (int.parse(item.type) == SURVEY_TYPE) SurveyFragment(item.id),
            if (item.allowComments == _ITEM_CAN_HAVE_COMMENT)
              ItemCommentFragment(),
          ],
        ),
      ),
    );
  }
}
