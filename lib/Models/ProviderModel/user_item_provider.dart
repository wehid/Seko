import 'package:flutter/material.dart';
import 'dart:convert';

import '../../Services/api.dart';
import '../ObjectModels/user_item.dart';
import '../RequestModels/create_user_item.dart';
import '../RequestModels/search_user_item.dart';

class UserItemProvider with ChangeNotifier{
  bool _isLoading = false;
  List<UserItem> _allUserItem = [];

  Future<void> getAllUserItem(SearchUserItem searchUserItem, String userToken) async{
    _isLoading = true;
    List<UserItem> response;

    try{
      String allUserItemString = await Api().getAllUserItem(searchUserItem, userToken);

      Iterable iterable = json.decode(allUserItemString)["Data"];
      response = iterable.map((item) => UserItem.fromJson(item)).toList();
      //todo:delete print
      print('number of user item is: ${response.length}');
      _allUserItem = response;
      _isLoading = false;
      notifyListeners();
    }catch (error){
      print('in get all user item error is: $error');
      throw error;
    }

  }

  Future<void> setItemAsReaded(CreateUserItem createUserItem, String userToken)async{
    _setIsLoading(true);
    UserItem response;

    try{
      String userItemString =await Api().setItemAsReaded(createUserItem, userToken);
      //todo:delete print
      print(userItemString);

      response = UserItem.fromJson(json.decode(userItemString));
      _allUserItem.add(response);
      _setIsLoading(false);
      notifyListeners();
    }catch (error){
      print('in set item as readed, error is: $error');
      throw error;
    }
  }

  bool isItemReaded(String itemId){
    return _allUserItem.any((item) => item.itemId == itemId);
  }

  void _setIsLoading(bool status){
    _isLoading = status;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  List<UserItem> get allUserItem => _allUserItem;
}