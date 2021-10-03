import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../GlobalWidgets/seko_text_form_field.dart';
import '../../Models/ObjectModels/create_comment.dart';
import '../../Models/ProviderModel/user_provider.dart';
import '../../Models/ProviderModel/item_provider.dart';
import '../../Models/ProviderModel/item_comments_provider.dart';

class WriteComment extends StatefulWidget {
  final int replayId;

  WriteComment({this.replayId});

  @override
  _WriteCommentState createState() => _WriteCommentState();
}

class _WriteCommentState extends State<WriteComment> {
  final _commentFormKey = GlobalKey<FormState>();
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

  String _emptyCommentValidator(String comment){
    if(comment == null || comment.isEmpty){
      return "پێویستە لە پێشدا بۆچوونەکەت بنووسی";
    }
    return null;
  }

  _sendComment(){
    if(_commentFormKey.currentState.validate()){
      CreateComment createComment = CreateComment(
        replyId: widget.replayId,
        comments: _itemCommentController.text,
        itemId: Provider.of<ItemProvider>(context, listen: false).selectedItem.id,
        userId: Provider.of<UserProvider>(context, listen: false).user.id,
      );
      Provider.of<ItemCommentsProvider>(context, listen: false).sendComment(createComment);
      _itemCommentController.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Form(
            key: _commentFormKey,
            child: SekoTextFormField(
              controller: _itemCommentController,
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
            // this is for rotating icon in 45 degree
            turns: AlwaysStoppedAnimation(155/360),
            child: Icon(
              Icons.send,
              color: Colors.green,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
