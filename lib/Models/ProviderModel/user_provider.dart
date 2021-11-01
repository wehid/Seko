import 'package:flutter/material.dart';
import 'dart:convert';

import '../../Services/api.dart';
import '../ObjectModels/user.dart';

class UserProvider with ChangeNotifier{
  User _user;
  bool _isLoading = false;
  String _token = '';

  Future login(String username, String password) async{
    _isLoading = true;
    User user = User();

    User loginUser = User(username: username, password: password);

    try{
      String userResponse = await Api().login(loginUser);
      user = User.fromJson(json.decode(userResponse));
      _setUser(user);
      _token = user.token;

      // _user = User.fromJson(json.decode(userResponse));
      // _user.introduction = removeAllHtmlTags(_user.introduction);
      // _token = _user.token;
      _isLoading = false;
    //  todo: delete print
      print('in login, user token is: ${_user.token}');
      notifyListeners();
    }catch(error){
      print('error in login: $error');
      throw error;
    }
  }


  Future<void> register(User newUser)async{
    _isLoading = true;
    User user = User();

    try{
      String userResponse = await Api().register(newUser);

      user = User.fromJson(json.decode(userResponse));
      _setUser(user);
      _token = user.token;
      _isLoading = false;
      //  todo: delete print
      print('in register, user token is: ${_user.token}');
      notifyListeners();
    }catch(error){
      print('error in register is: $error');
      throw error;
    }
  }

  Future<void> update(User updatedUser)async{
    _isLoading = true;
    User user = User();

    try{
      String userResponse = await Api().update(updatedUser);

      user = User.fromJson(json.decode(userResponse));
      _setUser(user);
      _token = user.token;
      // _user = User.fromJson(json.decode(userResponse));
      // _user.introduction = removeAllHtmlTags(_user.introduction);
      // _token = _user.token;
      _isLoading = false;
      //  todo: delete print
      print('in update, user token is: ${_user.token}');
      notifyListeners();
    }catch(error){
      print('error in update is: $error');
      throw error;
    }
  }

  void logout(){
    _user = null;
    _token = '';
    notifyListeners();
  }

  void _setUser(User user){
    _user = user;
    _user.introduction = removeAllHtmlTags(_user.introduction);
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  User get user => _user;

  String get token => _token;

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(
        r"<[^>]*>",
        multiLine: true,
        caseSensitive: true
    );

    return htmlText.replaceAll(exp, '').trim();
  }
}