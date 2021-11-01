// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seko/Models/ProviderModel/forum_comment_provider.dart';

import '../Widgets/forum_comment_widget.dart';
import '../../Models/ObjectModels/forum_comment.dart';

class ForumCommentFragment extends StatelessWidget {
  final String postId;

  ForumCommentFragment(this.postId);

  @override
  Widget build(BuildContext context) {
    ForumCommentProvider forumCommentProvider =
        Provider.of<ForumCommentProvider>(context);
    List<ForumComment> commentList = forumCommentProvider.forumCommentList;

    return forumCommentProvider.isLoading
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: commentList
                .map(
                  (comment) => Column(
                    children: [
                      const Divider(color: Colors.blueGrey, thickness: 1.2),
                      ForumCommentWidget(comment),
                    ],
                  ),
                )
                .toList(),
          );
  }
}
