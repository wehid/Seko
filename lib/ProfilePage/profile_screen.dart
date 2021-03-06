import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/ObjectModels/user.dart';
import '../Models/ProviderModel/user_provider.dart';
import 'Widgets/user_information_widget.dart';
import '../Models/ProviderModel/cities_provider.dart';
import '../Models/ObjectModels/city.dart';
import '../EditProfilePage/edit_profile_screen.dart';
import '../GlobalWidgets/seko_button.dart';
import '../GlobalWidgets/user_circle_avatar.dart';
import '../constants.dart';

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

  Widget userProfileCard(User user, BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color(0xffe5e5e5),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 8),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: UserCirlceAvatar(user.imagePath),
          ),
          Expanded(
            // flex: 2,
            child: Column(
              children: [
                Text(
                  user.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.blue,
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
                const SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider _userProvider = Provider.of<UserProvider>(context);
    User user = _userProvider.user;
    print("in profile screen, build method rebuild");
    // User user = Provider.of<UserProvider>(context, listen: false).user;

    return Scaffold(
      appBar: customAppBar("??????????????"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            userProfileCard(user, context),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    UserInformationWidget(
                      icon: Icons.person_outline,
                      title: "???????? ????????????????????",
                      description: '${user.username}',
                    ),
                    UserInformationWidget(
                      icon: Icons.location_on,
                      title: "??????",
                      description: '${_cityName(context, user.cityID)}',
                    ),
                    UserInformationWidget(
                      icon: Icons.phone,
                      title: "????????????",
                      description: '${user.mobile}',
                    ),
                    UserInformationWidget(
                      icon: Icons.web,
                      title: "????????????",
                      description: '${user.website}',
                    ),
                    UserInformationWidget(
                      icon: Icons.description,
                      title: "??????????????",
                      description: '${user.introduction}',
                    ),
                    SekoButton(
                      backgroundColor: Colors.blue,
                      buttonIcon: Icons.edit,
                      buttonString: "???????????????? ?????????? ??????????????",
                      onPressed: () => Navigator.of(context)
                          .pushNamed(EditProfileScreen.routeName),
                      textColor: Colors.white,
                      borderColor: Colors.blueGrey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
