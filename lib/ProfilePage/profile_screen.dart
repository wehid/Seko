import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/ObjectModels/user.dart';
import '../Models/ProviderModel/user_provider.dart';
import 'Widgets/user_information_widget.dart';
import 'Components/logout.dart';
import '../Models/ProviderModel/cities_provider.dart';
import '../Models/ObjectModels/city.dart';
import '../EditProfilePage/edit_profile_screen.dart';
import 'Components/my_courses.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile-screen';

  String _cityName(BuildContext context, String cityId) {
    City city = Provider.of<CitiesProvider>(context, listen: false)
        .getCityWithCityId(cityId);
    if (city == null) {
      return '';
    }
    return city.name;
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context, listen: false).user;

    void _openEditProfilePage() {
      Navigator.of(context).pushNamed(EditProfileScreen.routeName);
    }

    void _openMyCourses() {
      Navigator.of(context).pushNamed(MyCourses.routeName);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('پرۆفایل'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit_outlined,
              color: Colors.white,
            ),
            onPressed: _openEditProfilePage,
          ),
          IconButton(
            icon: Icon(
              Icons.menu_book,
              color: Colors.white,
            ),
            onPressed: _openMyCourses,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: CircleAvatar(
                      radius: 50,
                      child: Center(
                        child: Icon(Icons.person, size: 60),
                      ),
                    ),
                  ),
                  UserInformationWidget("ناوی بەکارهێنەر", '${user.username}'),
                  UserInformationWidget("ناو", '${user.name}'),
                  UserInformationWidget("ناوی سیانی", '${user.family}'),
                  UserInformationWidget("مۆبایل", '${user.mobile}'),
                  UserInformationWidget("ئیمەیڵ", '${user.email}'),
                  UserInformationWidget("ماڵپەڕ", '${user.website}'),
                  UserInformationWidget(
                      "شار", '${_cityName(context, user.cityID)}'),
                  UserInformationWidget("ناساندن", '${user.introduction}'),
                ],
              ),
            ),
          ),
          Logout(),
        ],
      ),
    );
  }
}
