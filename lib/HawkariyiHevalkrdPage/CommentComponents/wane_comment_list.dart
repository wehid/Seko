import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ProviderModel/wane_comment_provider.dart';
import '../../Models/ObjectModels/wane_comment.dart';
import '../Widgets/wane_comment_widget.dart';
import '../../constants.dart';

class WaneCommentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WaneCommentProvider waneCommentProvider =
        Provider.of<WaneCommentProvider>(context);

    List<WaneComment> commentList = waneCommentProvider.waneCommentList;

    return waneCommentProvider.isLoading
        ? Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: commentList
                  .map(
                    (comment) => Column(
                      children: [
                        customDivider(),
                        WaneCommentWidget(comment),
                      ],
                    ),
                  )
                  .toList(),
            ),
          );
  }
}
