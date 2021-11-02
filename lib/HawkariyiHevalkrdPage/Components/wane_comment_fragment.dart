import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ProviderModel/wane_comment_provider.dart';
import '../../Models/ObjectModels/wane_comment.dart';
import '../Widgets/wane_comment_widget.dart';

class WaneCommentFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WaneCommentProvider waneCommentProvider =
        Provider.of<WaneCommentProvider>(context);

    List<WaneComment> commentList = waneCommentProvider.waneCommentList;

    return waneCommentProvider.isLoading
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: commentList
                .map(
                  (comment) => Column(
                    children: [
                      const Divider(color: Colors.blueGrey, thickness: 1.2),
                      WaneCommentWidget(comment),
                    ],
                  ),
                )
                .toList(),
          );
  }
}
