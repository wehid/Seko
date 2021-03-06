import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../GlobalWidgets/send_comment_widget.dart';
import '../../Models/ObjectModels/item_comment.dart';
import '../../Models/ProviderModel/user_provider.dart';
import '../../Models/ProviderModel/item_provider.dart';
import '../../Models/ProviderModel/item_comments_provider.dart';

class WriteComment extends StatefulWidget {
  final String replayId;

  WriteComment({this.replayId});

  @override
  _WriteCommentState createState() => _WriteCommentState();
}

class _WriteCommentState extends State<WriteComment> {
  TextEditingController _itemCommentController;

  @override
  void initState() {
    _itemCommentController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _itemCommentController.dispose();
    super.dispose();
  }

  String _emptyCommentValidator(String comment) {
    if (comment == null || comment.isEmpty) {
      return "پێویستە لە پێشدا بۆچوونەکەت بنووسی";
    }
    return null;
  }

  _sendComment() {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      ItemComment createComment = ItemComment(
        replyId: widget.replayId,
        comments: _itemCommentController.text,
        itemId:
            Provider.of<ItemProvider>(context, listen: false).selectedItem.id,
        userId: userProvider.user.id,
      );
      String userToken = userProvider.token;
      Provider.of<ItemCommentsProvider>(context, listen: false)
          .sendComment(createComment, userToken);
      _itemCommentController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return SendCommentWidget(
      commentController: _itemCommentController,
      emptyCommentValidator: _emptyCommentValidator,
      sendComment: _sendComment,
    );

    // TODO: if every thing gone well, delete commented code
    
    // return Row(
    //   children: [
    //     Expanded(
    //       child: Form(
    //         key: _commentFormKey,
    //         child: SekoTextFormField(
    //           controller: _itemCommentController,
    //           label: 'بۆچوونی خۆت بنووسە',
    //           isPassword: false,
    //           textInputType: TextInputType.multiline,
    //           textInputAction: TextInputAction.newline,
    //           validator: _emptyCommentValidator,
    //         ),
    //       ),
    //     ),
    //     IconButton(
    //       onPressed: _sendComment,
    //       icon: RotationTransition(
    //         // this is for rotating icon in 45 degree
    //         turns: AlwaysStoppedAnimation(155 / 360),
    //         child: Icon(
    //           Icons.send,
    //           color: Colors.green,
    //           size: 30,
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
