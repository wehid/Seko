import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Services/sql_helper.dart';

import '../ProfilePage/profile_screen.dart';
import '../ProfilePage/Components/my_courses.dart';
import '../EditProfilePage/edit_profile_screen.dart';
import '../Models/ProviderModel/user_provider.dart';

class DashboardScreen extends StatelessWidget {
  Widget popupMenuRow(int value, String title, IconData icon) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Text(title),
          const Spacer(),
          Icon(
            icon,
            color: Colors.red.shade700,
          ),
        ],
      ),
    );
  }

  void _selectedMenuItemAction(BuildContext context, item) {
    switch (item) {
      case 0:
        Navigator.of(context).pushNamed(EditProfileScreen.routeName);
        break;
      case 1:
        _logout(context);
        break;
    }
  }

  void _logout(BuildContext context) {
    SQLHelper().deleteAll();
    Provider.of<UserProvider>(context, listen: false).logout();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text("داشبۆرد"),
            centerTitle: true,
            actions: [
              PopupMenuButton<int>(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                itemBuilder: (context) => [
                  popupMenuRow(0, "گۆڕینی پرۆفایل", Icons.edit),
                  popupMenuRow(1, "چوونە دەر", Icons.logout),
                ],
                onSelected: (item) => _selectedMenuItemAction(context, item),
              ),
            ],
            bottom: TabBar(
              tabs: [
                Tab(text: 'پرۆفایل'),
                Tab(text: 'خولەکانی من'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ProfileScreen(),
              MyCourses(),
            ],
          )),
    );
  }
}
