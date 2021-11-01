import 'package:flutter/material.dart';
import 'dart:convert';

import '../RequestModels/search_news.dart';
import '../ObjectModels/news.dart';
import '../../Services/api.dart';

class NewsProvider with ChangeNotifier{
  bool _isLoading = false;
  List<News> _newsList = [];
  News _selectedNews;

  Future getAllNews() async{
    List<News> response = [];
    SearchNews searchAllNews = SearchNews();

    try{
      _isLoading = true;
      String newsListString = await Api().getNews(searchAllNews);
      Iterable iterable = json.decode(newsListString)["Data"];
      response = iterable.map((element) => News.fromJson(element)).toList();
    //  todo: delete print
      print('in get all news, number of all news is: ${response.length}');
      _newsList = response;
      _isLoading = false;
      notifyListeners();
    }catch(error){
      print('in get all news, error is: $error');
      throw error;
    }
  }

  void setSelectedNews(News news){
    _selectedNews = news;
    notifyListeners();
  }

  News get selectedNews => _selectedNews;

  List<News> get newsList => _newsList;

  bool get isLoading => _isLoading;
}