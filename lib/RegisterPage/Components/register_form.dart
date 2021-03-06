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
  // this learner type is for teacher. but for admin and gust was difrent
  // TODO: if need, change this part for can choose learner type.
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
    if (_formKey.currentState.validate()) {
      setState(() {
        _isRegistering = true;
      });
      User registerUser = _registerUser();
      UserProvider userProvider =
          Provider.of<UserProvider>(context, listen: false);

      userProvider.register(registerUser).then((_) {
        _saveUsernameAndPassword(registerUser);
        _isRegistering = false;
        Navigator.of(context).pop();
      }).onError((_, __) {
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
    return emailValid ? null : "?????????? ?????????????? ?????????? ????????????";
  }

  String _passwordValidation(String value) {
    if (value.length < 5) {
      return "???????????????? ???????? ?????????? ???? 5 ?????? ??????";
    }
    return null;
  }

  String _passwordRepeatValidation(String value) {
    if (_passwordRepeatController.text != _passwordController.text) {
      return '???????????????? ?????????? ???????????????????????? ?????????????? ?????? ?????? ??????';
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
                      UploadUserPhoto(null),
                      const SizedBox(height: 8),
                      SekoTextFormField(
                        textInputAction: TextInputAction.next,
                        validator: emptyValidatorTFF,
                        label: "???????? ????????????????????",
                        isPassword: false,
                        controller: _usernameController,
                      ),
                      SekoTextFormField(
                        textInputAction: TextInputAction.next,
                        validator: _emailValidation,
                        label: "????????????",
                        textInputType: TextInputType.emailAddress,
                        isPassword: false,
                        controller: _emailController,
                      ),
                      SekoTextFormField(
                        textInputAction: TextInputAction.next,
                        validator: _passwordValidation,
                        label: "????????????????",
                        isPassword: true,
                        controller: _passwordController,
                      ),
                      SekoTextFormField(
                        textInputAction: TextInputAction.done,
                        validator: _passwordRepeatValidation,
                        label: "???????????????? ????????????????",
                        isPassword: true,
                        controller: _passwordRepeatController,
                      ),
                      DropdownCity(),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('???? ???????? ????????'),
                    Checkbox(
                      value: _saveMe,
                      onChanged: _changeSaveMe,
                    ),
                  ],
                ),
                SekoButton(
                  backgroundColor: Colors.blue,
                  buttonString: '???? ?????????? ????????',
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
