import 'package:flutter/material.dart';

import '../LoginPage/Components/login_form.dart';
import '../constants.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('چوونه ژوورەوە'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: LoginForm(),
      ),
    );
  }
}
