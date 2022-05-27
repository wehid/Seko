import 'package:flutter/material.dart';
import 'dart:convert';

import '../../Services/api.dart';
import '../ObjectModels/family_category.dart';
import '../ObjectModels/family_item.dart';
import '../RequestModels/search_family_item.dart';

class FamilyProvider with ChangeNotifier {
  bool _isLoading = false;
  List<FamilyCategory> _familyCategories = [];
  FamilyCategory _selectedFamilyCategory;
  List<FamilyItem> _familyItems = [];
  FamilyItem _selectedFamilyItem;

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

  Future getAllFamilyItems() async {
    return searchFamilyItems(SearchFamilyItem());
  }

  Future searchFamilyItems(SearchFamilyItem searchFamilyItem) async {
    _isLoading = true;
    List<FamilyItem> response = [];

    try {
      String familyItemsString = await Api().getFamilyItem(searchFamilyItem);

      Iterable iterable = json.decode(familyItemsString)["Data"];
      response =
          iterable.map((element) => FamilyItem.fromJson(element)).toList();

      // TODO: delete print
      print('in get family items, number of items are: ${response.length}');

      _isLoading = false;
      _familyItems = response;
      notifyListeners();
    } catch (error) {
      print('in get family items, error is: $error');
      throw error;
    }
  }

  void setSelectedFamilyCategory(FamilyCategory familyCategory) {
    _selectedFamilyCategory = familyCategory;
    notifyListeners();
  }

  void setSelectedFamilyItem(FamilyItem familyItem) {
    _selectedFamilyItem = familyItem;
    notifyListeners();
  }

  List<FamilyItem> getFamilyItemListWithCategoryId(String categoryId){
    return _familyItems.where((element) => element.familyCatId == categoryId).toList();
  }

  List<FamilyItem> getFamilyItemListWithCategoryIdAndType(String categoryId, String type){
    return _familyItems.where((element) => element.familyCatId == categoryId && element.type == type).toList();
  }

  bool get isLoading => _isLoading;

  List<FamilyCategory> get familyCategories => _familyCategories;

  FamilyCategory get selectedFamilyCategory => _selectedFamilyCategory;

  List<FamilyItem> get familyItems => _familyItems;

  FamilyItem get selectedFamilyItem => _selectedFamilyItem;
}
