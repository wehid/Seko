import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seko/constants.dart';

import '../../GlobalWidgets/seko_text_form_field.dart';
import '../../GlobalWidgets/seko_button.dart';
import '../../Models/ProviderModel/user_provider.dart';
import '../../Models/ProviderModel/banki_wane_provider.dart';
import '../../Models/ObjectModels/wane.dart';
import '../Widgets/send_post_item_row.dart';
import '../Widgets/dropdown_wane_group.dart';

class AddWanePost extends StatefulWidget {
  static const routeName = '/add-wane-post';

  @override
  _AddWanePostState createState() => _AddWanePostState();
}

class _AddWanePostState extends State<AddWanePost> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _titelController;
  TextEditingController _introductionController;
  TextEditingController _contentsController;
  TextEditingController _linkController;
  TextEditingController _videoUrlConroller;
  UserProvider _userProvider;

  @override
  void initState() {
    _titelController = TextEditingController();
    _introductionController = TextEditingController();
    _contentsController = TextEditingController();
    _linkController = TextEditingController();
    _videoUrlConroller = TextEditingController();
    _userProvider = Provider.of<UserProvider>(context, listen: false);

    super.initState();
  }

  @override
  void dispose() {
    _titelController.dispose();
    _introductionController.dispose();
    _contentsController.dispose();
    _linkController.dispose();
    _videoUrlConroller.dispose();

    super.dispose();
  }

  _sendWanePost() {
    if (_formKey.currentState.validate()) {
      Wane wanePost = Wane(
        userId: _userProvider.user.id,
        uploadGroupId: Provider.of<BankiWaneProvider>(context, listen: false)
            .selectedWaneGroup
            .id,
        title: _titelController.text,
        introduction: _introductionController.text,
        contents: _contentsController.text,
        link: _linkController.text,
        videoUrl: _videoUrlConroller.text,
        state: "0",
      );
      Provider.of<BankiWaneProvider>(context, listen: false)
          .sendWanePost(wanePost, _userProvider.token);
      _titelController.text = '';
      _introductionController.text = '';
      _contentsController.text = '';
      _linkController.text = '';
      _videoUrlConroller.text = '';
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("بانکی وانە"),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SendPostItemRow(
                  "بەکارهێنەر *",
                  Text(
                    _userProvider.user.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SendPostItemRow(
                  "بابەت *",
                  SekoTextFormField(
                    controller: _titelController,
                    validator: emptyValidatorTFF,
                  ),
                ),
                SendPostItemRow("ناوی پۆلێن", DropdownWaneGroup()),
                SendPostItemRow(
                  "بەستەری دەرەکی",
                  SekoTextFormField(
                    controller: _linkController,
                  ),
                ),
                SendPostItemRow(
                  "ئادرەسی ڤیدیۆ",
                  SekoTextFormField(
                    controller: _videoUrlConroller,
                  ),
                ),
                SendPostItemRow(
                  "کورتە",
                  SekoTextFormField(
                    controller: _introductionController,
                  ),
                ),
                SendPostItemRow(
                  "ناوەڕۆک *",
                  SekoTextFormField(
                    controller: _contentsController,
                    validator: emptyValidatorTFF,
                    textInputType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                  ),
                ),
                const SizedBox(height: 35),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SekoButton(
        backgroundColor: Colors.green,
        buttonIcon: Icons.save,
        textColor: Colors.white,
        buttonString: "پاشەکەوتکردن",
        onPressed: _sendWanePost,
      ),
    );
  }
}
