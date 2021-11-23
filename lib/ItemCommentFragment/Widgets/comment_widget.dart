import 'package:flutter/material.dart';

import '../../Models/ObjectModels/item_comment.dart';
import '../Components/write_comment.dart';

class CommentWidget extends StatefulWidget {
  final ItemComment itemComment;
  final bool isThisReplay;

  CommentWidget(this.itemComment, this.isThisReplay);

  @override
  _CommentWidgetState createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  bool _isShowWriteReplay = false;

  Widget _commentIcon(IconData icon, String text, Function click) {
    return InkWell(
      onTap: click,
      splashColor: Colors.green,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Text(text),
            Icon(icon),
          ],
        ),
      ),
    );
  }

  _showWriteReplay() {
    setState(() {
      _isShowWriteReplay = true;
    });
  }

  Widget _space() {
    return const SizedBox(height: 20);
  }

  TextStyle _titleTextStyle() {
    return TextStyle(
        color: widget.isThisReplay
            ? Colors.lightBlueAccent
            : Colors.green.shade800,
        fontSize: 19.5);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _space(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.itemComment.userName,
              style: _titleTextStyle(),
            ),
            Text(
              widget.itemComment.commentDate,
              style: _titleTextStyle(),
            ),
          ],
        ),
        _space(),
        Text(widget.itemComment.comments),
        _space(),
        if (!widget.isThisReplay)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TODO: add bookmark and favorite should complete later

              // _commentIcon(Icons.bookmark_border, "نیشاندار", null),
              _commentIcon(Icons.reply, "وڵامی دەوە", _showWriteReplay),
              // _commentIcon(Icons.favorite_border, "بەدڵمە", null),
            ],
          ),
        _space(),
        if (_isShowWriteReplay) WriteComment(replayId: widget.itemComment.id),
      ],
    );
  }
}
