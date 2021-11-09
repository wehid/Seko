import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ProviderModel/forum_comment_provider.dart';
import '../Widgets/forum_comment_widget.dart';
import '../../Models/ObjectModels/forum_comment.dart';
import '../../constants.dart';

class ForumCommentList extends StatelessWidget {
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
                      customDivider(),
                      ForumCommentWidget(comment),
                    ],
                  ),
                )
                .toList(),
          );
  }
}
