import 'package:flutter/material.dart';
import 'dart:convert';

import '../../Services/api.dart';
import '../ObjectModels/user_item_file.dart';
import '../RequestModels/search_user_item_file.dart';

class UserItemFileProvider with ChangeNotifier {
  bool _isLoading = false;
  UserItemFile _selectedUserItemFile;
  List<UserItemFile> _userItemFileList;

  Future SearchMyItemFiles(String userid) async {
    _isLoading = true;
    List<UserItemFile> response = [];
    // SearchUserItemFile mySearch = SearchUserItemFile(userId: userid);
    SearchUserItemFile mySearch = SearchUserItemFile();

    try {
      String myItemFilesString = await Api().getUserItemFile(mySearch);

      Iterable iterable = json.decode(myItemFilesString)["Data"];
      response =
          iterable.map((itemFile) => UserItemFile.fromJson(itemFile)).toList();

//  TODO: delete print
      print("in ge user item files, size of user item is: ${response.length}");

      _userItemFileList = response;
      _isLoading = false;

      notifyListeners();
    } catch (error) {
      print("in get user item files, error is: $error");
      throw error;
    }
  }

  bool get isLoading => _isLoading;

  List<UserItemFile> get userItemFiles => _userItemFileList;

  UserItemFile get selectedUserItemFile => _selectedUserItemFile;
}
