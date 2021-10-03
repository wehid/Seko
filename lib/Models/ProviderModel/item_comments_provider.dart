import 'package:flutter/material.dart';
import 'dart:convert';

import '../../Services/api.dart';
import '../RequestModels/search_item_comments.dart';
import '../ObjectModels/item_comment.dart';
import '../ObjectModels/create_comment.dart';

class ItemCommentsProvider with ChangeNotifier{
  List<ItemComment> _itemCommentList = [];
  bool _isLoading = false;

  Future<void> getAllItemComments()async{
    List<ItemComment> result = [];
    _isLoading = true;
    SearchItemComments searchAllItemComment = SearchItemComments();

    try{
      String itemCommentsString = await Api().searchItemComments(searchAllItemComment);

      Iterable iterable = json.decode(itemCommentsString)["Data"];
      result = iterable.map((comment) => ItemComment.fromJson(comment)).toList();

      //todo: this part is for debugging. delete it before release
      print('get comment item length is: ${result.length}');

      _itemCommentList = result;
      _isLoading = false;
      notifyListeners();

    }catch(error){
      print('in get all item comment, error is: $error');
      throw error;
    }

  }

  Future<void> getItemCommentListByItemId(String itemId) async{
    _isLoading = true;
    _itemCommentList = [];
    // notifyListeners();
    List<ItemComment> result = [];
    SearchItemComments searchItemComments = SearchItemComments(itemId: itemId);

    try{
      String itemCommentsString = await Api().searchItemComments(searchItemComments);
      //todo: delete print
      print(itemCommentsString);

      Iterable iterable = json.decode(itemCommentsString)["Data"];
      result = iterable.map((comment) => ItemComment.fromJson(comment)).toList();


      //todo: this part is for debugging. delete it before release
      print('get comment item by item id, length is: ${result.length}');

      _itemCommentList = result;
      _isLoading = false;
      notifyListeners();

      for (ItemComment comment in _itemCommentList) {
        print(comment.comments);
      }

      // return result;
    }catch (error){
      print('in get item comment by item id, error is: $error');
      throw error;
    }
  }

  Future<void> sendComment(CreateComment comment) async{
    _isLoading = true;
    notifyListeners();
    ItemComment response;

    try{
      String responseCommentString = await Api().sendItemComments(comment);
      //todo: delete print
      print(responseCommentString);

      response = ItemComment.fromJson(json.decode(responseCommentString));
      //todo: this part is for debugging. delete it before release
      print('after send comment, response username is: ${response.userName}');

      getItemCommentListByItemId(response.itemID);

      _isLoading = false;
      notifyListeners();
    }catch(error){
      print('in send comment, error is: $error');
      throw error;
    }
  }

  List<ItemComment> itemCommentsWithoutReplay(){
    return _itemCommentList.where((element) => element.replyID == null).toList();
  }

  bool get isLoading => _isLoading;

  List<ItemComment> get itemCommentList => _itemCommentList;
}