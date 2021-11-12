import 'package:flutter/material.dart';
import 'dart:convert';

import '../ObjectModels/wane_comment.dart';
import '../RequestModels/search_wane_comment.dart';
import '../../Services/api.dart';

class WaneCommentProvider with ChangeNotifier {
  bool _isLoading = false;
  List<WaneComment> _waneCommentList = [];

  Future getAllWaneComments() {
    return getWaneCommentByWaneId("");
  }

  Future getWaneCommentByWaneId(String waneId) async {
    SearchWaneComment searchWaneComment = SearchWaneComment(uploadID: waneId);
    List<WaneComment> response = [];

    try {
      _isLoading = true;
      String allWaneCommentString =
          await Api().getWaneCommet(searchWaneComment);

      // todo: delete print
      print(
          'in get wane comment for waneId: $waneId, all wane comment string is: $allWaneCommentString');

      Iterable iterable = json.decode(allWaneCommentString)["Data"];
      response =
          iterable.map((elemet) => WaneComment.fromJson(elemet)).toList();

      // todo: delete print
      print(
          'in get wane comment for waneId: $waneId, all comment number is: ${response.length}.');

      _waneCommentList = response;
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      print('in get wane comment by id: ${waneId}, error is: ${error}');
      throw error;
    }
  }

  Future sendWaneComment(WaneComment comment, String userToken) async {
    _isLoading = true;
    notifyListeners();
    WaneComment response;

    try {
      String responseCommentString =
          await Api().sendWaneCommet(comment, userToken);

      response = WaneComment.fromJson(json.decode(responseCommentString));

      getWaneCommentByWaneId(response.uploadID);

      _isLoading = false;
      notifyListeners();
    } catch (error) {
      print('in send wane comment, error is: $error');
      throw error;
    }
  }

  bool get isLoading => _isLoading;

  List<WaneComment> get waneCommentList => _waneCommentList;
}
