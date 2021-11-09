import 'package:flutter/material.dart';
import 'dart:convert';

import '../../Services/api.dart';
import '../ObjectModels/forum_post.dart';
import '../RequestModels/search_forum.dart';
import '../../constants.dart';
import '../ObjectModels/forum.dart';

class ForumProvider with ChangeNotifier {
  bool _isLoading = false;
  List<ForumPost> _forumPostList = [];
  List<Forum> _forumList = [];
  ForumPost _selectedFroumPost;

  Future getAllForum() async {
    _isLoading = true;
    List<Forum> response = [];

    try {
      String allForumString = await Api().getAllForum();

      Iterable iterable = json.decode(allForumString);
      response = iterable.map((element) => Forum.fromJson(element)).toList();

      // todo: delete print
      print('in get all forum, number of forum is: ${response.length}');

      _isLoading = false;
      _forumList = response;
      notifyListeners();
    } catch (error) {
      print('in get all forum, error is: $error');
      throw error;
    }
  }

  Future getAllForumPost() async {
    SearchForum searchAllFroum = SearchForum();
    _isLoading = true;
    List<ForumPost> response = [];

    try {
      _forumPostList = [];
      String allFroum = await Api().getForum(searchAllFroum);

      Iterable iterable = json.decode(allFroum)["Data"];
      response =
          iterable.map((element) => ForumPost.fromJson(element)).toList();

      // todo: delete print
      print('in get froums, number of froum post is: ${response.length}');

      _isLoading = false;
      _forumPostList = response;
      notifyListeners();
    } catch (error) {
      print('in get all prsyarxane, error is: $error');
      throw error;
    }
  }

  void setSelectedFroumPost(ForumPost selectedFroumPost) {
    _selectedFroumPost = selectedFroumPost;
    notifyListeners();
  }

  List<ForumPost> get prsyarxane {
    return _forumPostList
        .where((element) => element.forumType == PRSYARXANE)
        .toList();
  }

  List<ForumPost> get projesaz {
    return _forumPostList
        .where((element) => element.forumType == PROJESAZ)
        .toList();
  }

  List<Forum> get prsyarxaneForum {
    return _forumList.where((element) => element.type == PRSYARXANE).toList();
  }

  List<Forum> get projesazForum {
    return _forumList.where((element) => element.type == PROJESAZ).toList();
  }

  ForumPost get selectedFroumPost => _selectedFroumPost;

  List<ForumPost> get froumPostList => _forumPostList;

  List<Forum> get forumList => _forumList;

  bool get isLoading => _isLoading;
}
