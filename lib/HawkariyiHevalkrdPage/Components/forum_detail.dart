import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ProviderModel/forum_provider.dart';
import '../../Models/ObjectModels/forum_post.dart';
import '../../constants.dart';

class ForumDetail extends StatelessWidget {
  static const routeName = '/forum-detail';

  final String _projesaz = 'پرۆژەساز';
  final String _prsyarxane = 'پرسیارخانە';

  @override
  Widget build(BuildContext context) {
    ForumPost post =
        Provider.of<ForumProvider>(context, listen: false).selectedFroumPost;

    return Scaffold(
      appBar:
          customAppBar(post.forumType == PROJESAZ ? _projesaz : _prsyarxane),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (post.imagePath != '')
              Container(
                width: double.infinity,
                height: 200,
                child: Image.network(post.imagePath, fit: BoxFit.contain,),
              ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                post.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Text(post.contents),
          ],
        ),
      ),
    );
  }
}
