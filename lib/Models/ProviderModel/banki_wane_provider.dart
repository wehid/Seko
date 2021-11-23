import 'package:flutter/material.dart';
import 'dart:convert';

import '../../Services/api.dart';
import '../ObjectModels/wane.dart';
import '../RequestModels/search_banki_wane.dart';
import '../ObjectModels/wane_group.dart';

class BankiWaneProvider with ChangeNotifier {
  bool _isLoading = false;
  List<Wane> _bankiWane = [];
  List<WaneGroup> _waneGroupList = [];
  Wane _selectedWane;
  WaneGroup _selectedWaneGroup;

  Future getAllWaneGroup() async {
    _isLoading = true;
    List<WaneGroup> response = [];

    try {
      String allWaneGroupString = await Api().getAllWaneGroup();

      Iterable iterable = json.decode(allWaneGroupString);
      response =
          iterable.map((element) => WaneGroup.fromJson(element)).toList();

      print(
          'in get all wane group, number of wane group is: ${response.length}');
      _waneGroupList = response;
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      print('in get all wane group, error is: $error');
      throw error;
    }
  }

  Future sendWanePost(Wane post, String userToken) async {
    _isLoading = true;

    try {
      await Api().sendWanePost(post, userToken);

      // Wane response = Wane.fromJson(json.decode(waneResponseString));
      getAllBankiWane();
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      print('in send wane post, error is: $error');
      throw error;
    }
  }

  Future getAllBankiWane() async {
    SearchBankiWane searchAllBankiWane = SearchBankiWane();
    _isLoading = true;
    List<Wane> response = [];

    try {
      _bankiWane = [];
      String allBankiWaneString = await Api().getBankiWane(searchAllBankiWane);

      Iterable iterable = json.decode(allBankiWaneString)["Data"];
      response = iterable.map((element) => Wane.fromJson(element)).toList();

      //  todo: delete print
      print('in get all banki wane, number of wane is: ${response.length}');

      _isLoading = false;
      _bankiWane = response;
      notifyListeners();
    } catch (error) {
      print('in get all banki wane, error is: $error');
      throw error;
    }
  }

  void setSelectedWane(Wane selectedWane) {
    _selectedWane = selectedWane;
    notifyListeners();
  }

  void setSelectedWaneGroup(WaneGroup selectedWaneGroup) {
    _selectedWaneGroup = selectedWaneGroup;
    // notifyListeners();
  }

  Wane get selectedWane => _selectedWane;

  List<Wane> get bankiWane => _bankiWane;

  bool get isLoading => _isLoading;

  WaneGroup get selectedWaneGroup => _selectedWaneGroup;

  List<WaneGroup> get waneGroupList => _waneGroupList;
}
