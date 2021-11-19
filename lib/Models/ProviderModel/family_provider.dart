import 'package:flutter/material.dart';
import 'dart:convert';

import '../../Services/api.dart';
import '../ObjectModels/family_category.dart';

class FamilyProvider with ChangeNotifier {
  bool _isLoading = false;
  List<FamilyCategory> _familyCategories = [];
  FamilyCategory _selectedFamilyCategory;
  // TODO: list of family item
  // TODO: selected family item

  Future getAllFamilyCategories() async {
    _isLoading = true;
    List<FamilyCategory> response = [];

    try {
      String allFamilyCategoriesString = await Api().getFamilyCategories();

      Iterable iterable = json.decode(allFamilyCategoriesString);
      response =
          iterable.map((element) => FamilyCategory.fromJson(element)).toList();

      // TODO: delete print
      print(
          'in get all family categories, number of all categories are: ${response.length}');

      _familyCategories = response;
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      print('in get all family categories, error is: $error');
      throw error;
    }
  }

  void setSelectedFamilyCategory(FamilyCategory familyCategory) {
    _selectedFamilyCategory = familyCategory;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  List<FamilyCategory> get familyCategories => _familyCategories;

  FamilyCategory get selectedFamilyCategory => _selectedFamilyCategory;
}
