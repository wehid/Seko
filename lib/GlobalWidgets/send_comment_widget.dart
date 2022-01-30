import 'package:flutter/material.dart';

import 'seko_text_form_field.dart';

class SendCommentWidget extends StatefulWidget {
  final TextEditingController commentController;
  final String Function(String) emptyCommentValidator;
  final Function sendComment;

  SendCommentWidget({
    @required this.commentController,
    @required this.emptyCommentValidator,
    @required this.sendComment,
  });

  @override
  _SendCommentWidgetState createState() => _SendCommentWidgetState();
}

class _SendCommentWidgetState extends State<SendCommentWidget> {
    final _commentFormKey = GlobalKey<FormState>();

  _checkValidator() {
    if (_commentFormKey.currentState.validate()) {
      widget.sendComment();
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
              controller: widget.commentController,
              label: 'بۆچوونی خۆت بنووسە',
              isPassword: false,
              textInputType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              validator: widget.emptyCommentValidator,
            ),
          ),
        ),
        IconButton(
          onPressed: ()=>_checkValidator(),
          icon: RotationTransition(
            // this is for rotating icon in 45 degree
            turns: AlwaysStoppedAnimation(155 / 360),
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
