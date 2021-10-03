import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ProviderModel/user_provider.dart';
import '../../Models/ObjectModels/user.dart';
import '../../LoginPage/login_screen.dart';
import '../../ProfilePage/profile_screen.dart';

class UserTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).user;
    return user == null?
        LoginScreen():
        ProfileScreen();
  }
}
