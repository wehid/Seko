import 'package:flutter/material.dart';

class BookTabBar extends StatelessWidget {
  final bool _isTextBook;
  BookTabBar(this._isTextBook);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.blueAccent,
      labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      tabs: [
        Tab(
          text: "زانیاری",
          icon: Icon(Icons.info),
        ),
        Tab(
          text: "پوختە",
          icon: Icon(Icons.text_snippet),
        ),
        if (!_isTextBook)
          Tab(
            text: "گوێگرتن",
            icon: Icon(Icons.headphones),
          ),
      ],
    );
  }
}
