import 'package:flutter/material.dart';

import 'Components/comment_list.dart';
import 'Components/write_comment.dart';

class ItemCommentFragment extends StatefulWidget {
  static const String routeName = '/item-comment-screen';

  @override
  _ItemCommentFragmentState createState() => _ItemCommentFragmentState();
}

class _ItemCommentFragmentState extends State<ItemCommentFragment> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey.shade200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'بۆچوونەکان:',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          WriteComment(),
          CommentLis(),
        ],
      ),
    );
  }
}
