import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seko/Models/ObjectModels/forum.dart';
import 'package:seko/Models/ProviderModel/forum_provider.dart';

import '../../constants.dart';
import '../../GlobalWidgets/seko_text_form_field.dart';
import '../../GlobalWidgets/seko_button.dart';
import '../../Models/ProviderModel/user_provider.dart';
import '../../Models/ObjectModels/forum_post.dart';
import '../Widgets/dropdown_forum.dart';

class AddForumPost extends StatefulWidget {
  static const routeName = '/add-forum-post';
  final String forumType;

  const AddForumPost(this.forumType);

  @override
  _AddForumPostState createState() => _AddForumPostState();
}

Widget itemRow(String title, Widget trailing) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Text("$title :"),
        const SizedBox(width: 30),
        // const Spacer(),
        Expanded(child: trailing),
      ],
    ),
  );
}

class _AddForumPostState extends State<AddForumPost> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController;
  TextEditingController videoLinkController;
  TextEditingController constentsController;
  UserProvider _userProvider;

  @override
  void initState() {
    titleController = TextEditingController();
    videoLinkController = TextEditingController();
    constentsController = TextEditingController();
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    videoLinkController.dispose();
    constentsController.dispose();
    super.dispose();
  }

  _sendForumPost() {
    if (_formKey.currentState.validate()) {
      ForumPost post = ForumPost(
          userID: _userProvider.user.id,
          title: titleController.text,
          contents: constentsController.text,
          videoUrl: videoLinkController.text,
          forumID: Provider.of<ForumProvider>(context, listen: false)
              .selectedForum
              .id);
      print('the forum post is ready to send');
      // todo: send the post
      // todo: clean the form
      // todo: close the page
    }
  }

  String dropdownEmptyValidator(Forum value) {
    if (value == null) {
      return "زانیاری داواکراو نابێ بەتاڵ بێت";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          widget.forumType == PROJESAZ ? 'پرۆژەساز' : 'پرسیارخانە'),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                itemRow(
                  "بەکارهێنەر *",
                  Text(
                    _userProvider.user.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                itemRow(
                  "بابەت *",
                  SekoTextFormField(
                    controller: titleController,
                    validator: emptyValidatorTFF,
                  ),
                ),
                itemRow("ناوی پۆلێن", DropdownForum(widget.forumType)),
                itemRow(
                  "ئادرەسی ڤیدیۆ",
                  SekoTextFormField(
                    controller: videoLinkController,
                  ),
                ),
                itemRow(
                  "ناوەڕۆک *",
                  SekoTextFormField(
                    controller: constentsController,
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
        onPressed: _sendForumPost,
      ),
    );
  }
}
