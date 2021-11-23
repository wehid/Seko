import 'package:flutter/material.dart';

import '../../Models/ObjectModels/wane_comment.dart';

class WaneCommentWidget extends StatelessWidget {
  final WaneComment waneComment;

  WaneCommentWidget(this.waneComment);

  Widget _space() {
    return const SizedBox(height: 20);
  }

  TextStyle _titleTextStyle() {
    return TextStyle(color: Colors.green.shade800, fontSize: 19.5);
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
              waneComment.userUsername,
              style: _titleTextStyle(),
            ),
            Text(
              waneComment.commentDate,
              style: _titleTextStyle(),
            ),
          ],
        ),
        _space(),
        Text(waneComment.comments),
        _space(),
      ],
    );
  }
}
