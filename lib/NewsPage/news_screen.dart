import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/ProviderModel/news_provider.dart';
import '../Models/ObjectModels/news.dart';
import 'Widgets/news_item_tile.dart';
import '../constants.dart';

class NewsScreen extends StatelessWidget {
  bool _isFirstRun = true;

  void _loadNews(BuildContext context) {
    Provider.of<NewsProvider>(context, listen: false).getAllNews();
    _isFirstRun = false;
  }

  @override
  Widget build(BuildContext context) {
    if (_isFirstRun) _loadNews(context);

    final newProvider = Provider.of<NewsProvider>(context);
    List<News> newsList = newProvider.newsList;
    return Scaffold(
      appBar: customAppBar('هەواڵ'),
      body: newProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                News thisNews = newsList[index];
                return NewsItemTile(thisNews);
              },
            ),
    );
  }
}
