import 'package:flutter/material.dart';
import 'dart:convert';

import '../../Services/api.dart';
import '../ObjectModels/squad.dart';
import '../ObjectModels/user.dart';

class SquadProvider with ChangeNotifier {
  bool _isLoading = false;
  Squad _squad;

  Future<void> getUserSquad(User user) async {
    _isLoading = true;
    Squad response;

    try {
      String squadString = await Api().searchSquadForUser(user);

      print("in get use squad, squad string is: $squadString");

      response = Squad.fromJson(json.decode(squadString));

      _squad = response;
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      // TODO: DELETE PRINT
      print('in get user squad, error is: $error');
      throw error;
    }
  }

  get isLoading => _isLoading;

  get mySquad => _squad;
}
