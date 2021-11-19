import 'package:flutter/material.dart';
import 'dart:convert';

import '../../Services/api.dart';
import '../ObjectModels/item.dart';
import '../RequestModels/search_item.dart';

class ItemProvider with ChangeNotifier {
  bool _isLoading = false;
  Item _selectedItem;
  List<Item> _itemList;
  List<Item> _allItemList;

  Future<void> getAllItems() async {
    _isLoading = true;
    List<Item> allItems = [];

    try {
      String allItemsString = await Api().getAllItems();

      Iterable iterable = json.decode(allItemsString);
      allItems = iterable.map((item) => Item.fromJson(item)).toList();
      _allItemList = allItems;
      //todo: delete print
      print('in get all items, items length is: ${_allItemList.length}');
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      print('in get all items, error is: $error');
      throw error;
    }
  }

  //todo: delete this function that take from internet.
  Future<List<Item>> getItems(String lessonId) async {
    List<Item> myItems = [];
    SearchItem searchItem = SearchItem(lessonID: lessonId);

    try {
      String itemsString = await Api().getItemsBySearch(searchItem);
      //todo: delete print
      print(itemsString);

      Iterable iterable = json.decode(itemsString)["Data"];
      myItems = iterable.map((item) => Item.fromJson(item)).toList();

      _setItemList(myItems);

      //todo: this part is for debugging. delete it before release
      print(myItems.length);
      for (Item item in myItems) {
        print(item.title);
      }

      return myItems;
    } catch (error) {
      throw error;
    } finally {
      _setIsLoading(false);
    }
  }

  void _setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setSelectedItem(Item item) {
    _selectedItem = item;
    notifyListeners();
  }

  void _setItemList(List<Item> itemsList) {
    _itemList = itemsList;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  Item get selectedItem => _selectedItem;

  List<Item> get itemList => _itemList;

  List<Item> get allItemList => _allItemList;
}
