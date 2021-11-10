import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ProviderModel/forum_provider.dart';
import '../../Models/ObjectModels/forum.dart';
import '../../constants.dart';

class DropdownForum extends StatefulWidget {
  final String forumType;

  DropdownForum(this.forumType);

  @override
  _DropdownForumState createState() => _DropdownForumState();
}

class _DropdownForumState extends State<DropdownForum> {
  ForumProvider forumProvider;
  List<Forum> forumList;
  Forum currentForum;

  @override
  void initState() {
    forumProvider = Provider.of<ForumProvider>(context, listen: false);
    forumList = widget.forumType == PROJESAZ
        ? forumProvider.projesazForum
        : forumProvider.prsyarxaneForum;

    currentForum = forumList[0];
    forumProvider.setSelectedForum(currentForum);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    forumProvider = Provider.of<ForumProvider>(context);

    return Container(
      width: double.infinity,
      height: 55,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: DropdownButton<Forum>(
        value: currentForum,
        hint: Text('ناوی پۆلێن هەڵبژێرە'),
        onChanged: (newForum) {
          currentForum = newForum;
          forumProvider.setSelectedForum(newForum);
        },
        icon: Icon(Icons.arrow_downward_outlined),
        items: forumList.map((forum) {
          return DropdownMenuItem<Forum>(
            value: forum,
            child: Text(forum.title),
          );
        }).toList(),
      ),
    );
  }
}
