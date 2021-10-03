import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ObjectModels/item_comment.dart';
import '../Widgets/comment_widget.dart';
import '../../Models/ProviderModel/item_provider.dart';
import '../../Models/ProviderModel/item_comments_provider.dart';

class CommentLis extends StatefulWidget {
  @override
  _CommentLisState createState() => _CommentLisState();
}

class _CommentLisState extends State<CommentLis> {
  bool _firstLoad = true;
  List<ItemComment> _itemCommentList;
  ItemCommentsProvider _commentsProvider;
  String _itemId;

  bool _isCommentHasReplay(ItemComment comment) {
    if (comment.replies == null) return false;
    return comment.replies.length != 0;
  }


  @override
  void didChangeDependencies() {
    if(_firstLoad){
      _itemId =
          Provider.of<ItemProvider>(context, listen: false).selectedItem.id;
      _commentsProvider = Provider.of<ItemCommentsProvider>(context);
      _commentsProvider.getItemCommentListByItemId(_itemId);

      _firstLoad = false;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _itemCommentList =
        _commentsProvider.itemCommentsWithoutReplay();
    //todo: delete
    print("in comment list, item comment list is: ${_itemCommentList.length}");

    return _commentsProvider.isLoading
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: _itemCommentList
                .map((comment) => Column(
                      children: [
                        const Divider(color: Colors.blueGrey, thickness: 1.2,),
                        CommentWidget(comment, false),
                        if (_isCommentHasReplay(comment))
                          Column(
                            children: comment.replies
                                .map((reply) => CommentWidget(reply, true))
                                .toList(),
                          )
                      ],
                    ))
                .toList());
  }
}
