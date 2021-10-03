import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../Models/ObjectModels/news.dart';

class NewsItemTile extends StatelessWidget {
  final News news;

  NewsItemTile(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.75,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(10),
      color: Colors.red.shade700,
      child: GestureDetector(
        child: Column(
          children: [
            Container(
              child: Image.network(news.imagePath),
              height: 200,
            ),
            const SizedBox(height: 15),
            Html(data:news.introduction),
          ],
        ),
      ),
    );
  }
}
