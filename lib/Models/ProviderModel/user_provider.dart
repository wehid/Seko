import 'package:flutter/material.dart';
import 'dart:convert';

import '../../Services/api.dart';
import '../ObjectModels/user.dart';
import '../ObjectModels/user_log.dart';
import '../RequestModels/search_user_log.dart';

class UserProvider with ChangeNotifier {
  User _user;
  bool _isLoading = false;
  String _token = '';
  String _errorMessage;
  List<UserLog> _userLogs = [];

  Future<void> login(String username, String password) async {
    _isLoading = true;
    User user = User();
    _errorMessage = null;

    User loginUser = User(username: username, password: password);

    try {
      String userResponse = await Api().login(loginUser);
      user = User.fromJson(json.decode(userResponse));
      _setUser(user);
      _token = user.token;
      _isLoading = false;
      //  todo: delete print
      print('in login, user token is: ${_user.token}');
      notifyListeners();
    } catch (error) {
      print('error in login: $error');
      if (error == 404 || error == 405) {
        _errorMessage = "ناوی بەکارهێنەر یان تێپەڕوشە هەڵەیە";
      } else {
        _errorMessage = "دووبارە تاقی بکەرەوە";
      }
      throw error;
    }
  }

  Future<void> register(User newUser) async {
    _isLoading = true;
    User user = User();
    _errorMessage = null;

    try {
      String userResponse = await Api().register(newUser);

      user = User.fromJson(json.decode(userResponse));
      _setUser(user);
      _token = user.token;
      _isLoading = false;
      //  todo: delete print
      print('in register, user token is: ${_user.token}');
      notifyListeners();
    } catch (error) {
      print('error in register is: $error');
      if (error == 503) {
        _errorMessage = "ناوی بەکارهێنەر یان ئیمەیڵ دووپاتە";
      } else {
        _errorMessage = "دووبارە تاقی بکەرەوە";
      }
      throw error;
    }
  }

  Future<void> update(User updatedUser) async {
    _isLoading = true;
    User user = User();

    try {
      String userResponse = await Api().update(updatedUser);

      user = User.fromJson(json.decode(userResponse));
      _setUser(user);
      _token = user.token;
      _isLoading = false;
      //  todo: delete print
      print('in update, user token is: ${_user.token}');
      notifyListeners();
    } catch (error) {
      print('error in update is: $error');
      throw error;
    }
  }

  Future getUserLogs() async {
    _isLoading = true;
    List<UserLog> response = [];
    SearchUserLog searchAll = SearchUserLog(userId: int.parse(_user.id));

    try {
      String stringUserLogs = await Api().getUserLogs(searchAll);

      Iterable iterable = json.decode(stringUserLogs)["Data"];
      response = iterable.map((element) => UserLog.fromJson(element)).toList();

      // TODO: delete print
      print('in get user logs. number of logs are: ${response.length}');

      _isLoading = false;
      _userLogs = response;
      notifyListeners();
    } catch (error) {
      print('in get user logs, error is: $error');
      throw error;
    }
  }

  void logout() {
    _user = null;
    _token = '';
    notifyListeners();
  }

  void _setUser(User user) {
    _user = user;
    _user.introduction = removeAllHtmlTags(_user.introduction);
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  User get user => _user;

  String get token => _token;

  String get errorMessage => _errorMessage;

  List<UserLog> get userLogs => _userLogs;

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '').trim();
  }
}
