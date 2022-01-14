import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/ObjectModels/user.dart';
import '../Models/ProviderModel/user_provider.dart';
import 'Widgets/user_information_widget.dart';
import '../Models/ProviderModel/cities_provider.dart';
import '../Models/ObjectModels/city.dart';

import '../SquadPage/squad_screen.dart';

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

  Widget userProfileCard(User user) {
    return Container(
      width: double.infinity,
      height: 150,
      color: Colors.lightGreen,
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CircleAvatar(
              radius: 50,
              child: Center(
                child: Icon(Icons.person, size: 60),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text(
                  user.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  user.email,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context, listen: false).user;

    return Scaffold(
      body: Column(
        children: [
          userProfileCard(user),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(SquadScreen.routeName);
                    },
                    child: Text("گرووپی من"),
                  ),
                  UserInformationWidget(
                    icon: Icons.person_outline,
                    title: "ناوی بەکارهێنەر",
                    description: '${user.username}',
                  ),
                  UserInformationWidget(
                    icon: Icons.location_on,
                    title: "شار",
                    description: '${_cityName(context, user.cityID)}',
                  ),
                  UserInformationWidget(
                    icon: Icons.phone,
                    title: "مۆبایل",
                    description: '${user.mobile}',
                  ),
                  UserInformationWidget(
                    icon: Icons.web,
                    title: "ماڵپەڕ",
                    description: '${user.website}',
                  ),
                  UserInformationWidget(
                    icon: Icons.description,
                    title: "ناساندن",
                    description: '${user.introduction}',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
