import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/ProviderModel/user_provider.dart';
import '../Models/ObjectModels/login.dart';
import '../GlobalWidgets/seko_text_form_field.dart';
import '../GlobalWidgets/seko_button.dart';
import '../constants.dart';
import '../Services/sql_helper.dart';

class DeleteAccountScreen extends StatefulWidget {
  static const routeName = '/delete-account-screen';

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  final String deleteMessage =
      "سەرنج: پاش سڕینەوە هەژمار، زانیارییەکان دەپارێزرێن بەڵام ئێوە ناتوانن تازە بەم هەژمارە بچنە ژوورەوە";
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  UserProvider _userProvider;
  Login _savedLogin;
  bool _isFirstRun = true;
  bool _isDeletingAccount = false;

  @override
  void initState() {
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _firstRunSetup() async {
    _savedLogin = await _readSavedLogin();
    _isFirstRun = false;
  }

  Future<Login> _readSavedLogin() async {
    print('load _savedLogin method');
    SQLHelper helper = SQLHelper();
    List<Login> savedLoginList = await helper.getLogin();
    return savedLoginList.length > 0 ? savedLoginList[0] : null;
  }

  String _passwordValidation(String value) {
    if (value == null || value.isEmpty) {
      return "زانیاری داواکراو نابێ بەتاڵ بێت";
    } else if (value != _savedLogin.password) {
      return "تێپەڕوشە هەڵەیە";
    } else {
      return null;
    }
  }

  void _completeDeleteAccount() {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isDeletingAccount = true;
      });
      String password = _passwordController.text;

      _userProvider.deleteAccount(password).then((_) {
        SQLHelper().deleteAll();
        _isDeletingAccount = false;
        _userProvider.logout();
        Navigator.of(context).pop();
      }).onError((error, stackTrace) {
        setState(() {
          _isDeletingAccount = false;
        });
        showWarningAlertDialog(_userProvider.errorMessage, context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isFirstRun) _firstRunSetup();
    return Scaffold(
      appBar: customAppBar("سڕینەوەی هەژمار"),
      body: (_isDeletingAccount || _userProvider.isLoading)
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    deleteMessage,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: SekoTextFormField(
                      controller: _passwordController,
                      validator: _passwordValidation,
                      label: "تێپەڕوشە",
                      isPassword: true,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  SekoButton(
                    backgroundColor: Colors.red,
                    buttonString: "سڕینەوەی هەژمار",
                    textColor: Colors.white,
                    buttonIcon: Icons.delete_forever,
                    onPressed: _completeDeleteAccount,
                  )
                ],
              ),
            ),
    );
  }
}
