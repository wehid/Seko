import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'learning_tab.dart';
import 'user_tab.dart';
import '../../HawkariyiHevalkrdPage/hawkariyi_hevalkrd_screen.dart';
import '../../NewsPage/news_screen.dart';
import '../../Models/ProviderModel/user_provider.dart';

class MainScreenScaffold extends StatefulWidget {
  @override
  _MainScreenScaffoldState createState() => _MainScreenScaffoldState();
}

class _MainScreenScaffoldState extends State<MainScreenScaffold> {
  static const _LEARNING_TAB_INDEX = 0;

  int _selectedTabIndex = _LEARNING_TAB_INDEX;


  //list of screen to show for each tab
  final List<Widget> _tabScreen = [
    LearningTab(),
    HawkariyiHevalkrdScreen(),
    NewsScreen(),
    UserTab(),
  ];


  @override
  void initState() {
    if(Provider.of<UserProvider>(context, listen: false).user == null){
      _selectedTabIndex = _tabScreen.length-1;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabScreen.elementAt(_selectedTabIndex),
      bottomNavigationBar: BottomNavigationBar(
        //this method listen to the click
        onTap: (index) {
          setState(() {
            //change selected tab index to the index that clicked
            _selectedTabIndex = index;
          });
        },
        //for the change of color of bottom navigation bar background color
        //to the tab color. if change to "fixed", the color is not change
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedTabIndex,
        selectedFontSize: 16,
        selectedIconTheme: IconThemeData(size: 22),
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'هۆبەی ڕاهێزان',
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervisor_account),
              label: 'هاوکاریی هەڤاڵکرد',
              backgroundColor: Colors.lime.shade700),
          BottomNavigationBarItem(
              icon: Icon(Icons.live_tv_outlined),
              label: 'هەواڵ',
              backgroundColor: Colors.pinkAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'پرۆفایل',
              backgroundColor: Colors.deepOrangeAccent),
        ],
      ),
    );
  }
}
