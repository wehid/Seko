import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ObjectModels/wane_comment.dart';
import '../../Models/ProviderModel/banki_wane_provider.dart';
import '../../Models/ProviderModel/user_provider.dart';
import '../../Models/ProviderModel/wane_comment_provider.dart';
import '../Widgets/write_comment_widget.dart';


class WriteWaneComment extends StatefulWidget {
  final String replayId;

  const WriteWaneComment({this.replayId});

  @override
  _WriteWaneCommentState createState() => _WriteWaneCommentState();
}

class _WriteWaneCommentState extends State<WriteWaneComment> {
  final _commentFormKey = GlobalKey<FormState>();
  TextEditingController _waneCommentController;

  @override
  void initState() {
    _waneCommentController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _waneCommentController.dispose();
    super.dispose();
  }

  _sendComment() {
    if (_commentFormKey.currentState.validate()) {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      WaneComment comment = WaneComment(
        replyID: widget.replayId,
        comments: _waneCommentController.text,
        uploadID: Provider.of<BankiWaneProvider>(context, listen: false)
            .selectedWane
            .id,
        userID: userProvider.user.id,
      );
      String userToken = userProvider.token;
      Provider.of<WaneCommentProvider>(context, listen: false)
          .sendWaneComment(comment, userToken);
      _waneCommentController.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return WriteCommentWidget(
      commentController: _waneCommentController,
      formKey: _commentFormKey,
      sendCommetn: _sendComment,
    );
  }
}
