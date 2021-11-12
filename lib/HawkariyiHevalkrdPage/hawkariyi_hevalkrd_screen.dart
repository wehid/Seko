import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/ProviderModel/banki_wane_provider.dart';
import '../Models/ProviderModel/forum_provider.dart';
import '../Models/ProviderModel/forum_comment_provider.dart';

import 'Tabs/banki_wane_tab.dart';
import 'Tabs/prsyarxane_tab.dart';
import 'Tabs/projesaz_tab.dart';

class HawkariyiHevalkrdScreen extends StatelessWidget {
  static const routeName = '/hawkariyi-hevalkrd';

  @override
  Widget build(BuildContext context) {
    Provider.of<BankiWaneProvider>(context, listen: false).getAllBankiWane();
    Provider.of<BankiWaneProvider>(context, listen: false).getAllWaneGroup();
    Provider.of<ForumProvider>(context, listen: false).getAllForumPost();
    Provider.of<ForumProvider>(context, listen: false).getAllForum();
    Provider.of<ForumCommentProvider>(context, listen: false)
        .getAllForumComment();

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
              BankiWaneTab(),
              PrsyarxaneTab(),
              ProjesazTab(),
            ],
          )),
    );
  }
}
