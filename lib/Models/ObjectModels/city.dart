import 'package:flutter/material.dart';

class City with ChangeNotifier{
  String iD;
  String name;
  String provinceID;
  String provinceName;

  City({this.iD, this.name, this.provinceID, this.provinceName});

  City _selectedCity;

  City.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['Name'];
    provinceID = json['ProvinceID'];
    provinceName = json['ProvinceName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Name'] = this.name;
    data['ProvinceID'] = this.provinceID;
    data['ProvinceName'] = this.provinceName;
    return data;
  }

  // get all City from api and return them.
  // Future<List<City>> getAllCity() async {
  //   List<City> myCities = [];
  //   try {
  //     String cityListString = await Api().getAllCity();
  //     Iterable iterable = json.decode(cityListString);
  //     myCities = iterable.map((item) => City.fromJson(item)).toList();
  //   }catch (error){
  //     throw error;
  //   }
  //   return myCities;
  // }

  City get selectedCity => _selectedCity;

  set selectedCity(City city) {
    _selectedCity = city;
    notifyListeners();
  }
}