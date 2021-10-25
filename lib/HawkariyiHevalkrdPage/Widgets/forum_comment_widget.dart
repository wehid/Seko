import 'package:flutter/material.dart';

import '../../Models/ObjectModels/forum_comment.dart';

class ForumCommentWidget extends StatelessWidget {
  final ForumComment forumComment;

  ForumCommentWidget( this.forumComment);

  Widget _space() {
    return const SizedBox(height: 20);
  }

  TextStyle _titleTextStyle() {
    return TextStyle(
      color: Colors.green.shade800,
      fontSize: 19.5);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _space(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              forumComment.userUsername,
              style:_titleTextStyle(),
            ),
            Text(
              forumComment.replyDate,
              style: _titleTextStyle(),
            ),
          ],
        ),
        _space(),
        Text(forumComment.contents),
        _space(),
      ],
    );
  }
}
