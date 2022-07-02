import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Services/sql_helper.dart';

import '../GlobalWidgets/seko_text_form_field.dart';
import '../GlobalWidgets/seko_button.dart';
import '../constants.dart';
import '../Models/ObjectModels/login.dart';
import '../Models/ProviderModel/user_provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const routeName = '/change-password-screen';

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _repeatNewPasswordController = TextEditingController();
  UserProvider userProvider;
  Login savedLogin;
  bool _isFirstRun = true;
  bool _isChangingPassowrd = false;

  @override
  void initState() {
    userProvider = Provider.of<UserProvider>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _repeatNewPasswordController.dispose();

    super.dispose();
  }

  void _firstRunSetup() async {
    savedLogin = await _savedLogin();
    _isFirstRun = false;
  }

  Future<Login> _savedLogin() async {
    print('load _savedLogin method');
    SQLHelper helper = SQLHelper();
    List<Login> savedLoginList = await helper.getLogin();
    return savedLoginList.length > 0 ? savedLoginList[0] : null;
  }

  String _newPasswordValidation(String value) {
    if (value == null || value.isEmpty) {
      return "زانیاری داواکراو نابێ بەتاڵ بێت";
    } else if (value.length < 5) {
      return "تێپەڕوشە نابێ کەمتر لە 5 پیت بێت";
    } else if (value == savedLogin.password) {
      return "تێپەڕوشەی تازە پێویستە جیاواز بێت لە پێشوەکەی";
    }
    return null;
  }

  String _passwordRepeatValidation(String value) {
    if (value == null || value.isEmpty) {
      return "زانیاری داواکراو نابێ بەتاڵ بێت";
    } else if (value != _newPasswordController.text) {
      return 'تێپەڕوشە لەگەڵ دووبارەکەیدا پێویستە وەک یەک بێت';
    }
    return null;
  }

  String _oldPasswordValidation(String value) {
    if (value == null || value.isEmpty) {
      return "زانیاری داواکراو نابێ بەتاڵ بێت";
    } else if (value != savedLogin.password) {
      return "تێپەڕوشەی پێشوو هەڵەیە";
    } else {
      return null;
    }
  }

  void _saveNewPassword(String newPassword) {
    Login newLogin =
        Login(username: savedLogin.username, password: newPassword);
    SQLHelper().insertLogin(newLogin);
  }

  void _completeChangingPassword() {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isChangingPassowrd = true;
      });
      String newPassword = _newPasswordController.text;
      String oldPassword = _oldPasswordController.text;

      userProvider.changePassword(oldPassword, newPassword).then((_) {
        _saveNewPassword(newPassword);
        _isChangingPassowrd = false;
        Navigator.of(context).pop();
      }).onError((error, stackTrace) {
        setState(() {
          _isChangingPassowrd = false;
        });
        showWarningAlertDialog(userProvider.errorMessage, context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isFirstRun) _firstRunSetup();

    return Scaffold(
      appBar: customAppBar("گۆڕینی تێپەڕوشە"),
      body: (_isChangingPassowrd || userProvider.isLoading)
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SekoTextFormField(
                          textInputAction: TextInputAction.next,
                          validator: _oldPasswordValidation,
                          label: "تێپەڕوشەی پێشوو",
                          isPassword: true,
                          controller: _oldPasswordController,
                        ),
                        SekoTextFormField(
                          textInputAction: TextInputAction.next,
                          validator: _newPasswordValidation,
                          label: "تێپەڕوشەی تازه",
                          isPassword: true,
                          controller: _newPasswordController,
                        ),
                        SekoTextFormField(
                          textInputAction: TextInputAction.done,
                          validator: _passwordRepeatValidation,
                          label: "دووپات",
                          isPassword: true,
                          controller: _repeatNewPasswordController,
                        ),
                      ],
                    ),
                  ),
                  SekoButton(
                    backgroundColor: Colors.blue,
                    buttonString: 'پاشەکەوت کردن',
                    textColor: Colors.white,
                    buttonIcon: Icons.save,
                    onPressed: () {
                      _completeChangingPassword();
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
