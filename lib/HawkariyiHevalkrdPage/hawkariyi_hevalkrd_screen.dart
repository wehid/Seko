import 'package:flutter/material.dart';

import 'Tabs/banki_wane.dart';

class HawkariyiHevalkrdScreen extends StatelessWidget {
  static const routeName = '/hawkariyi-hevalkrd';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text("هاوکاریی هەڤاڵکرد"),
            centerTitle: true,
            actions: [Image.asset("assets/images/krg_logo.png")],
            bottom: TabBar(
              tabs: [
                Tab(text: 'بانکی وانه'),
                Tab(text: 'پرسیارخانە'),
                Tab(text: 'پرۆژەسازی'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              BankiWane(),
              Icon(Icons.ac_unit),
              Icon(Icons.access_alarm),
            ],
          )),
    );
  }
}
