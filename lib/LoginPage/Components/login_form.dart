import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../Models/ObjectModels/login.dart';
import '../../GlobalWidgets/seko_text_form_field.dart';
import '../../Services/sql_helper.dart';
import '../../Models/ProviderModel/user_provider.dart';
import '../../RegisterPage/register_screen.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  SQLHelper helper;

  bool _saveMe = true;
  bool _showProgressBar = false;

  @override
  void initState() {
    helper = SQLHelper();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _changeSaveMe(bool saveMe) {
    setState(() {
      _saveMe = saveMe;
    });
  }

  void _login() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _showProgressBar = true;
      });
      String username = _usernameController.text;
      String password = _passwordController.text;

      List<Login> savedLogin = await helper.getLogin();
      if (savedLogin.length > 0) helper.deleteAll();

      UserProvider userProvider =
          Provider.of<UserProvider>(context, listen: false);
      userProvider.login(username, password).then((_) {
        // setState(() {
        //   _showProgressBar = false;
        // });
        _showProgressBar = false;

        downloadAllNeededAfterLogin(context);

        Login login = Login(
          username: username,
          password: password,
        );

        helper.insertLogin(login);
      }).onError((error, stackTrace) {
        setState(() {
          _showProgressBar = false;
        });
        showWarningAlertDialog(userProvider.errorMessage, context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _showProgressBar
        ? Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      SekoTextFormField(
                        controller: _usernameController,
                        textInputAction: TextInputAction.next,
                        isPassword: false,
                        label: "ناوی بەکارهێنەر",
                        validator: emptyValidatorTFF,
                      ),
                      SekoTextFormField(
                        controller: _passwordController,
                        textInputAction: TextInputAction.done,
                        isPassword: true,
                        label: "تێپەڕوشە",
                        validator: emptyValidatorTFF,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('لە بیرم مەکە'),
                    Checkbox(
                      value: _saveMe,
                      onChanged: _changeSaveMe,
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: _login,
                  child: Text('چوونە ژوورەوە'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(RegisterScreen.routeName);
                      },
                      child: Text("بوون بە ئەندام"),
                    ),
                    TextButton(
                        onPressed: () {}, child: Text("تێپەڕوشەم بیر چۆتەوە")),
                  ],
                )
              ],
            ),
          );
  }
}
