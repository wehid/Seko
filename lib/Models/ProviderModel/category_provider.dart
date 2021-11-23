import 'package:flutter/material.dart';
import 'dart:convert';

import '../../Services/api.dart';
import '../ObjectModels/category.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> _categoryList = [];
  bool _isLoading = false;
  Category _selectedCategory;


  CategoryProvider(){
    getAllCategory();
  }

  Future<void> getAllCategory() async {
    if (_categoryList.length == 0) {
      _categoryList = [];
      _isLoading = true;
      List<Category> myCategories = [];
      try {
        String categoryListString = await Api().getAllCategory();
        _isLoading = false;
        Iterable iterable = json.decode(categoryListString);
        myCategories = iterable.map((item) => Category.fromJson(item)).toList();
        _categoryList = myCategories;

        //todo: this part is for debugging. delete it before release
        print('all category length is: ${_categoryList.length}');

        notifyListeners();
      } catch (error) {
        throw error;
      }
    }
  }

  Category get selectedCategory => _selectedCategory;

  bool get isLoading => _isLoading;

  List<Category> get categoryList => _categoryList;

  void setSelectedCategory(Category selectedCategory) {
    _selectedCategory = selectedCategory;
    print(_selectedCategory.title);
    notifyListeners();
  }

  void deselectCategory(){
    _selectedCategory = null;
    notifyListeners();
  }
}
