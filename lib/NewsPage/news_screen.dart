import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/ProviderModel/news_provider.dart';
import '../Models/ObjectModels/news.dart';
import 'Widgets/news_item_tile.dart';
import '../constants.dart';

class NewsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    List<News> newsList = Provider.of<NewsProvider>(context, listen: false).newsList;
    return Scaffold(
      appBar: customAppBar('هەواڵ'),
      body: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index){
          News thisNews = newsList[index];
          return NewsItemTile(thisNews);
        },
      ),
    );
  }
}
