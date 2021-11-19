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
  ForumProvider _forumProvider;
  List<Forum> _forumList;
  Forum _currentForum;

  @override
  void initState() {
    _forumProvider = Provider.of<ForumProvider>(context, listen: false);
    _forumList = widget.forumType == PROJESAZ
        ? _forumProvider.projesazForum
        : _forumProvider.prsyarxaneForum;

    _currentForum = _forumList[0];
    _forumProvider.setSelectedForum(_currentForum);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        value: _currentForum,
        onChanged: (newForum) {
          _forumProvider.setSelectedForum(newForum);
          setState(() {
            _currentForum = newForum;
          });
        },
        icon: Icon(Icons.arrow_downward_outlined),
        items: _forumList.map((forum) {
          return DropdownMenuItem<Forum>(
            value: forum,
            child: Text(forum.title),
          );
        }).toList(),
      ),
    );
  }
}
