import 'dart:convert';
import 'package:flutter/material.dart';

import '../../Services/api.dart';
import '../ObjectModels/city.dart';

class CitiesProvider with ChangeNotifier {
  City _selectedCity;
  List<City> _cityList = [];

  CitiesProvider() {
    getAllCity();
  }

  // get all City from api and return them.
  Future<void> getAllCity() async {
    try {
      String cityListString = await Api().getAllCity();
      Iterable iterable = json.decode(cityListString);
      _cityList = iterable.map((item) => City.fromJson(item)).toList();

      //todo: this part is for debugging. delete it before release
      print('all city number is: ${_cityList.length}');

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  List<City> get cityList => _cityList;

  City get selectedCity => _selectedCity;

  void setSelectedCity(City value) {
    _selectedCity = value;
    notifyListeners();
  }

  City getCityWithCityId(String cityId) {
    if (cityId == null || _cityList == null) {
      return null;
    }
    return _cityList.firstWhere((city) => city.iD == cityId);
  }
}
