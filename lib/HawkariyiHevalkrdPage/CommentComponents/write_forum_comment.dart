import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ObjectModels/forum_comment.dart';
import '../../Models/ProviderModel/forum_comment_provider.dart';
import '../../Models/ProviderModel/user_provider.dart';
import '../../Models/ProviderModel/forum_provider.dart';
import '../Widgets/write_comment_widget.dart';

class WriteForumCommetn extends StatefulWidget {
  @override
  _WriteForumCommetnState createState() => _WriteForumCommetnState();
}

class _WriteForumCommetnState extends State<WriteForumCommetn> {
  final _commentFormKey = GlobalKey<FormState>();
  TextEditingController _commentController;

  @override
  void initState() {
    _commentController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  _sendComment() {
    if (_commentFormKey.currentState.validate()) {
      final _userProvider = Provider.of<UserProvider>(context, listen: false);
      ForumComment comment = ForumComment(
        userID: _userProvider.user.id,
        forumEntryID:
            Provider.of<ForumProvider>(context, listen: false).selectedFroumPost.iD,
        contents: _commentController.text,
      );
      String userToken = _userProvider.token;
      Provider.of<ForumCommentProvider>(context, listen: false)
          .sendForumComment(comment, userToken);
      _commentController.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return WriteCommentWidget(
      sendCommetn: _sendComment,
      formKey: _commentFormKey,
      commentController: _commentController,
    );
  }
}
