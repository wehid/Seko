import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/ObjectModels/user.dart';
import '../Models/ProviderModel/user_provider.dart';
import '../GlobalWidgets/seko_text_form_field.dart';
import '../RegisterPage/Widgets/dropdown_city.dart';
import '../GlobalWidgets/seko_button.dart';
import '../constants.dart';

import '../Models/ProviderModel/upload_provider.dart';

class EditProfileScreen extends StatefulWidget {
  static const routeName = '/edit-profile-screen';

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  User _user;
  UserProvider _userProvider;
  UploadProvider _uploadProvider;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _familyController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  bool _isUpdatingUser = false;
  String _userPhotoUrl;

  //todo: change email validation from register page to constant page and use here and add email edit
  // TextEditingController _emailController = TextEditingController();
  TextEditingController _siteController = TextEditingController();
  TextEditingController _introductionController = TextEditingController();

  @override
  void initState() {
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    _user = _userProvider.user;
    _nameController.text = _user.name;
    _familyController.text = _user.family;
    _mobileController.text = _user.mobile;
    _siteController.text = _user.website;
    _introductionController.text = _user.introduction;
    _userPhotoUrl = _user.imagePath;
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _familyController.dispose();
    _mobileController.dispose();
    // _emailController.dispose();
    _siteController.dispose();
    _introductionController.dispose();
    super.dispose();
  }

  void _updateUser() {
    setState(() {
      _isUpdatingUser = true;
    });

    User updatedUser = _user;
    updatedUser.name = _nameController.text;
    updatedUser.family = _familyController.text;
    updatedUser.mobile = _mobileController.text;
    updatedUser.website = _siteController.text;
    updatedUser.introduction = _introductionController.text;
    updatedUser.cityID = getSelectedCityId(context);
    updatedUser.imagePath = _userPhotoUrl;

    Provider.of<UserProvider>(context, listen: false)
        .update(updatedUser)
        .then((value) => Navigator.of(context).pop());
  }

  void _chosePhoto() {
    // final uploadProvider = Provider.of<UploadProvider>(context);
    _uploadProvider.uploadUserPhoto(_user.token);
    _userPhotoUrl = _uploadProvider.fileUrl;
  }

  @override
  Widget build(BuildContext context) {
    _uploadProvider = Provider.of<UploadProvider>(context);

    return _isUpdatingUser
        ? progressPage()
        : Scaffold(
            appBar: customAppBar('گۆڕینی پرۆفایل'),
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: _chosePhoto,
                            child: Text("وێنەکەت هەڵبژێرە"),
                          ),
                          SekoTextFormField(
                            controller: _nameController,
                            label: 'ناو',
                          ),
                          SekoTextFormField(
                            controller: _familyController,
                            label: 'ناوی سیانی',
                          ),
                          SekoTextFormField(
                            controller: _mobileController,
                            label: 'مۆبایل',
                          ),
                          SekoTextFormField(
                            controller: _siteController,
                            label: 'سایت',
                          ),
                          SekoTextFormField(
                            controller: _introductionController,
                            label: 'ناساندن',
                            textInputAction: TextInputAction.newline,
                            textInputType: TextInputType.multiline,
                          ),
                          DropdownCity(
                            cityId: _user.cityID,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SekoButton(
                    buttonIcon: Icons.save,
                    buttonString: 'پاشەکەوت کردن',
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    onPressed: _updateUser,
                  ),
                ),
              ],
            ),
          );
  }
}
