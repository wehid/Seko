import 'package:flutter/material.dart';
import 'dart:convert';

import '../../Services/api.dart';
import '../ObjectModels/forum_comment.dart';
import '../RequestModels/search_forum_comment.dart';

class ForumCommentProvider with ChangeNotifier {
  bool _isLoading = false;
  List<ForumComment> _forumCommentList = [];

  Future getAllForumComment() async {
    getForumCommentByPostId("");
  }

  Future getForumCommentByPostId(String forumPostId) async {
    SearchForumComment searchPostComment =
        SearchForumComment(forumEntryID: forumPostId);
    List<ForumComment> response = [];

    try {
      _isLoading = true;
      String allForumCommentString =
          await Api().getForumCommet(searchPostComment);

      Iterable iterable = json.decode(allForumCommentString)["Data"];
      response =
          iterable.map((elemet) => ForumComment.fromJson(elemet)).toList();

      // todo: delete print
      print(
          'in get forum comment for forumPostId: $forumPostId, all comment number is: ${response.length}');

      _forumCommentList = response;
      _isLoading = false;

      notifyListeners();
    } catch (error) {
      print('in get all forum comment, error is: $error');
      throw error;
    }
  }

  bool get isLoading => _isLoading;

  List<ForumComment> get forumCommentList => _forumCommentList;
}
