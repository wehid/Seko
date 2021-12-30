import 'package:flutter/material.dart';
import 'dart:convert';

import '../../Services/api.dart';
import '../ObjectModels/item.dart';
import '../RequestModels/search_item.dart';

class ItemProvider with ChangeNotifier {
  bool _isLoading = false;
  Item _selectedItem;
  List<Item> _itemList;

  //TODO: delete this function that take from internet.
  Future<List<Item>> getItems(String lessonId) async {
    List<Item> myItems = [];
    SearchItem searchItem = SearchItem(lessonID: lessonId);

    try {
      String itemsString = await Api().getItemsBySearch(searchItem);

      Iterable iterable = json.decode(itemsString)["Data"];
      myItems = iterable.map((item) => Item.fromJson(item)).toList();

      _setItemList(myItems);

      //TODO: this part is for debugging. delete it before release
      print(
          "in get item for lesson id: $lessonId, number of items are: ${myItems.length}");

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
}
