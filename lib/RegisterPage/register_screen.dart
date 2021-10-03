import 'package:flutter/material.dart';

import 'Components/register_form.dart';
import '../constants.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    print('call register build');
    return Scaffold(
      appBar: customAppBar('خۆ تۆمار کردن'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: RegisterForm(),
      ),
    );
  }
}
