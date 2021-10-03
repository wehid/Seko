import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Services/sql_helper.dart';
import '../../Models/ProviderModel/user_provider.dart';
import '../../GlobalWidgets/seko_button.dart';

class Logout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _logout() {
      SQLHelper().deleteAll();
      Provider.of<UserProvider>(context, listen: false).logout();
    }

    return SekoButton(
      onPressed: _logout,
      borderColor: Colors.red,
      buttonString: 'چوونەدەر',
      buttonIcon: Icons.logout,
    );
  }
}
