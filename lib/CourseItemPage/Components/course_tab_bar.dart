import 'package:flutter/material.dart';

class CourseTabBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return                 Padding(
      padding: const EdgeInsets.only(top: 15),
      child: SizedBox(
        height: 30,
        child: TabBar(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.blueAccent,
          labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          tabs: [
            Tab(text: "پێشەکی"),
            Tab(text: "ناوەڕۆک"),
            Tab(text: "ناساندن"),
          ],
        ),
      ),
    );
  }
}
