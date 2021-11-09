import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ObjectModels/create_wane_comment.dart';
import '../../GlobalWidgets/seko_text_form_field.dart';
import '../../Models/ProviderModel/banki_wane_provider.dart';
import '../../Models/ProviderModel/user_provider.dart';
import '../../Models/ProviderModel/wane_comment_provider.dart';
import '../../constants.dart';

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

  String _emptyCommentValidator(String comment) {
    if (comment == null || comment.isEmpty) {
      return "پێویستە لە پێشدا بۆچوونەکەت بنووسی";
    }
    return null;
  }

  _sendComment() {
    if (_commentFormKey.currentState.validate()) {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      CreateWaneComment comment = CreateWaneComment(
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
    return Column(
      children: [
        customDivider(),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Form(
                key: _commentFormKey,
                child: SekoTextFormField(
                  controller: _waneCommentController,
                  label: 'بۆچوونی خۆت بنووسە',
                  isPassword: false,
                  textInputType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  validator: _emptyCommentValidator,
                ),
              ),
            ),
            IconButton(
              onPressed: _sendComment,
              icon: RotationTransition(
                turns: AlwaysStoppedAnimation(155 / 360),
                child: Icon(
                  Icons.send,
                  color: Colors.green,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
