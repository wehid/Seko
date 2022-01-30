import 'package:flutter/material.dart';
import 'dart:convert';

import '../../Services/api.dart';
import '../ObjectModels/squad.dart';
import '../ObjectModels/user.dart';
import '../ObjectModels/squad_activity.dart';
import '../RequestModels/search_squad_activity.dart';

class SquadProvider with ChangeNotifier {
  bool _isLoading = false;
  bool _isLoadingActivities = false;
  Squad _squad;
  List<SquadActivity> _squadActivityList;

  Future<void> getUserSquad(User user) async {
    _isLoading = true;
    Squad response;

    try {
      String squadString = await Api().searchSquadForUser(user);

      response = Squad.fromJson(json.decode(squadString));

      _squad = response;

      // TODO: DELETE PRINT
      print("in get use squad, squad id is: ${response.id}");

      _isLoading = false;
      notifyListeners();
    } catch (error) {
      // TODO: DELETE PRINT
      print('in get user squad, error is: $error');
      throw error;
    }
  }

  Future<void> searchSquadActivity(String squadId, String userToken) async {
    _isLoadingActivities = true;
    // notifyListeners();
    SearchSquadActivity searchSquadActivity =
        SearchSquadActivity(squadId: squadId);

    List<SquadActivity> response;

    try {
      String squadActivityListString =
          await Api().searchSquadActivity(searchSquadActivity, userToken);

      Iterable iterable = json.decode(squadActivityListString)["Data"];
      response =
          iterable.map((element) => SquadActivity.fromJson(element)).toList();

      // TODO: DELETE PRINT
      print(
          "in search squad activities for squad id: $squadId, number of squad activities are: ${response.length}");

      _isLoadingActivities = false;
      _squadActivityList = response;
      notifyListeners();
    } catch (error) {
      print(
          "in search squad activities for squad id: $squadId, error is: $error");
      throw error;
    }
  }

  Future sendSquadActivity(
      SquadActivity squadActivity, String userToken) async {
    _isLoadingActivities = true;
    notifyListeners();

    try {
      String squadResponseString =
          await Api().sendSquadActivity(squadActivity, userToken);

      print("in send squad Activity, response is: $squadResponseString");
      _isLoading = false;
      searchSquadActivity(squadActivity.squadId, userToken);
    } catch (error) {
      print(
          "in send squad activity for squad id: ${squadActivity.squadId}, error is: $error");
      throw error;
    }
  }

  get isLoading => _isLoading;

  get mySquad => _squad;

  get squadActivityList => _squadActivityList;

  get isLoadingActivities => _isLoadingActivities;
}
