import 'package:flutter/material.dart';
import 'dart:convert';

import '../../Services/api.dart';
import '../ObjectModels/forum_post.dart';
import '../RequestModels/search_Forum.dart';
import '../../constants.dart';

class ForumProvider with ChangeNotifier{

  bool _isLoading = false;
  List<ForumPost> _forumList = [];
  ForumPost _selectedFroumPost;

  Future getAllForumPost() async{
    SearchForum searchAllFroum = SearchForum();
    _isLoading = true;
    List<ForumPost> response = [];

    try {
      _forumList = [];
      String allFroum = await Api().getForum(searchAllFroum);
      
      Iterable iterable = json.decode(allFroum)["Data"];
      response = iterable.map((element) => ForumPost.fromJson(element)).toList();

      // todo: delete print
      print('in get froums, number of froum post is: ${response.length}');

      _isLoading = false;
      _forumList = response;
      notifyListeners();
    } catch (error) {
      print('in get all prsyarxane, error is: $error');
      throw error;
    }
  }

  
  void setSelectedFroumPost(ForumPost selectedFroumPost){
    _selectedFroumPost = selectedFroumPost;
    notifyListeners();
  }

  List<ForumPost> get prsyarxane{
    return _forumList.where((element) => element.forumType == PRSYARXANE).toList();
  }

  List<ForumPost> get projesaz{
    return _forumList.where((element) => element.forumType == PROJESAZ).toList();
  }

  ForumPost get selectedFroumPost => _selectedFroumPost;

  List<ForumPost> get froumList => _forumList;

  bool get isLoading => _isLoading;
}