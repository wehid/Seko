import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ProviderModel/forum_provider.dart';
import '../../Models/ObjectModels/forum_post.dart';
import '../Components/forum_detail.dart';

class ProjesazTab extends StatelessWidget {
  void _openWaneDetail(BuildContext context, ForumPost selectedPrsyar) {
    Provider.of<ForumProvider>(context, listen: false)
        .setSelectedFroumPost(selectedPrsyar);
    Navigator.of(context).pushNamed(ForumDetail.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final forumProvider = Provider.of<ForumProvider>(context);
    List<ForumPost> _prsyarxane = forumProvider.projesaz;
    bool isLoading = forumProvider.isLoading;

    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            body: ListView.builder(
              itemCount: _prsyarxane.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  elevation: 5,
                  child: ListTile(
                    leading: Text("${_prsyarxane[index].userUsername}: "),
                    title: Text(_prsyarxane[index].title),
                    subtitle: Text(_prsyarxane[index].forumName),
                    onTap: () {
                      _openWaneDetail(context, _prsyarxane[index]);
                    },
                  ),
                );
              },
            ),
          );
  }
}
