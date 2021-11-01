import 'package:flutter/material.dart';
import 'dart:convert';

import '../../Services/api.dart';
import '../ObjectModels/wane.dart';
import '../RequestModels/search_banki_wane.dart';

class BankiWaneProvider with ChangeNotifier{
  bool _isLoading = false;
  List<Wane> _bankiWane = [];
  Wane _selectedWane;

  Future getAllBankiWane() async{
    SearchBankiWane searchAllBankiWane = SearchBankiWane();
    _isLoading = true;
    List<Wane> response = [];

    try{
      _bankiWane = [];
      String allBankiWaneString = await Api().getBankiWane(searchAllBankiWane);

      Iterable iterable = json.decode(allBankiWaneString)["Data"];
      response = iterable.map((element) => Wane.fromJson(element)).toList();

    //  todo: delete print
      print('in get all banki wane, number of wane is: ${response.length}');

      _isLoading = false;
      _bankiWane = response;
      notifyListeners();
    }catch(error){
      print('in get all banki wane, error is: $error');
      throw error;
    }
  }

  void setSelectedWane(Wane selectedWane){
    _selectedWane = selectedWane;
    notifyListeners();
  }


  Wane get selectedWane => _selectedWane;

  List<Wane> get bankiWane => _bankiWane;

  bool get isLoading => _isLoading;
}