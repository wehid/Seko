import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../GlobalWidgets/seko_text_form_field.dart';

class WriteCommentWidget extends StatefulWidget {
  final Function sendCommetn;
  final GlobalKey formKey;
  final TextEditingController commentController;

  const WriteCommentWidget({
    @required this.sendCommetn,
    @required this.formKey,
    @required this.commentController,
  });

  @override
  _WriteCommentWidgetState createState() => _WriteCommentWidgetState();
}

class _WriteCommentWidgetState extends State<WriteCommentWidget> {
  String _emptyCommentValidator(String comment) {
    if (comment == null || comment.isEmpty) {
      return "پێویستە لە پێشدا بۆچوونەکەت بنووسی";
    }
    return null;
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
                key: widget.formKey,
                child: SekoTextFormField(
                  controller: widget.commentController,
                  label: 'بۆچوونی خۆت بنووسە',
                  isPassword: false,
                  textInputType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  validator: _emptyCommentValidator,
                ),
              ),
            ),
            IconButton(
              onPressed: widget.sendCommetn,
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
