import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seko/GlobalWidgets/seko_button.dart';

import '../Widgets/dropdown_city.dart';
import '../../GlobalWidgets/seko_text_form_field.dart';
import '../../constants.dart';
import '../../Models/ObjectModels/user.dart';
import '../../Models/ProviderModel/user_provider.dart';
import '../../Models/ProviderModel/upload_provider.dart';
import '../../Services/sql_helper.dart';
import '../../Models/ObjectModels/login.dart';
import '../../GlobalWidgets/upload_user_photo.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _learnerType = '4';
  final _enabledStatus = '1';
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordRepeatController = TextEditingController();
  bool _saveMe = true;
  bool _isRegistering = false;

  void _changeSaveMe(bool saveMe) {
    setState(() {
      _saveMe = saveMe;
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordRepeatController.dispose();
    super.dispose();
  }

  //make user with data that entered and return it
  User _registerUser() {
    User user = User(
      username: _usernameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      type: _learnerType,
      status: _enabledStatus,
      cityID: getSelectedCityId(context),
      image: Provider.of<UploadProvider>(context, listen: false).fileName,
      imagePath: Provider.of<UploadProvider>(context, listen: false).fileUrl,
    );
    return user;
  }

  void _saveUsernameAndPassword(User user) {
    Login login = Login(username: user.username, password: user.password);
    SQLHelper().insertLogin(login);
  }

  //check validations and register user, save user and save username and password
  void _completeRegistering(BuildContext context) {
    setState(() {
      _isRegistering = true;
    });
    if (_formKey.currentState.validate()) {
      User registerUser = _registerUser();
      UserProvider userProvider =
          Provider.of<UserProvider>(context, listen: false);

      userProvider.register(registerUser).then((value) {
        _saveUsernameAndPassword(registerUser);
        _isRegistering = false;
        Navigator.of(context).pop();
      }).onError((error, stackTrace) {
        setState(() {
          _isRegistering = false;
        });
        showWarningAlertDialog(userProvider.errorMessage, context);
      });
    }
  }

  String _emailValidation(String value) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    return emailValid ? null : "تکایە ئیمەیڵێ درووس بنووسە";
  }

  String _passwordValidation(String value) {
    if (value.length < 5) {
      return "تێپەڕوشە نابێ کەمتر لە 5 پیت بێت";
    }
    return null;
  }

  String _passwordRepeatValidation(String value) {
    if (_passwordRepeatController.text != _passwordController.text) {
      return 'تێپەڕوشە لەگەڵ دووبارەکەیدا پێویستە وەک یەک بێت';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return _isRegistering
        ? Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SekoTextFormField(
                        textInputAction: TextInputAction.next,
                        validator: emptyValidatorTFF,
                        label: "ناوی بەکارهێنەر",
                        isPassword: false,
                        controller: _usernameController,
                      ),
                      SekoTextFormField(
                        textInputAction: TextInputAction.next,
                        validator: _emailValidation,
                        label: "ئیمەیڵ",
                        textInputType: TextInputType.emailAddress,
                        isPassword: false,
                        controller: _emailController,
                      ),
                      SekoTextFormField(
                        textInputAction: TextInputAction.next,
                        validator: _passwordValidation,
                        label: "تێپەڕوشە",
                        isPassword: true,
                        controller: _passwordController,
                      ),
                      SekoTextFormField(
                        textInputAction: TextInputAction.done,
                        validator: _passwordRepeatValidation,
                        label: "دووپاتەی تێپەڕوشە",
                        isPassword: true,
                        controller: _passwordRepeatController,
                      ),
                      DropdownCity(),
                      UploadUserPhoto(null),
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
                SekoButton(
                  backgroundColor: Colors.blue,
                  buttonString: 'خۆ تۆمار کردن',
                  textColor: Colors.white,
                  buttonIcon: Icons.login,
                  onPressed: () {
                    _completeRegistering(context);
                  },
                ),
              ],
            ),
          );
  }
}
