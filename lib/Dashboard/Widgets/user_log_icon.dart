import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../UserLogsPage/user_logs_screen.dart';
import '../../Models/ProviderModel/user_provider.dart';

class UserLogicon extends StatefulWidget {
  @override
  _UserLogiconState createState() => _UserLogiconState();
}

class _UserLogiconState extends State<UserLogicon> {
  UserProvider _userProvider;

  @override
  void initState() {
    super.initState();
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    _userProvider.getUserLogs();
  }

  @override
  Widget build(BuildContext context) {
    print("user logs rebuild");
    return Stack(
      children: [
        IconButton(
          icon: Image.asset("assets/images/logs.png"),
          onPressed: () =>
              Navigator.of(context).pushNamed(UserLogsScreen.routeName),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.deepPurple,
            ),
            child: Center(
              child: Text(
                _userProvider.numberOfUnreadUserLog().toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
