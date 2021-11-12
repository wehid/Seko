import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../GlobalWidgets/seko_text_form_field.dart';
import '../../GlobalWidgets/seko_button.dart';
import '../../Models/ProviderModel/user_provider.dart';
import '../../Models/ProviderModel/forum_provider.dart';
import '../../Models/ObjectModels/forum_post.dart';
import '../Widgets/dropdown_forum.dart';
import '../Widgets/send_post_item_row.dart';

class AddForumPost extends StatefulWidget {
  static const routeName = '/add-forum-post';
  final String forumType;

  const AddForumPost(this.forumType);

  @override
  _AddForumPostState createState() => _AddForumPostState();
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
      Provider.of<ForumProvider>(context, listen: false)
          .sendForumPost(post, _userProvider.token);
      titleController.text = '';
      constentsController.text = '';
      videoLinkController.text = '';
      Navigator.of(context).pop();
    }
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
                    controller: titleController,
                    validator: emptyValidatorTFF,
                  ),
                ),
                SendPostItemRow("ناوی پۆلێن", DropdownForum(widget.forumType)),
                SendPostItemRow(
                  "ئادرەسی ڤیدیۆ",
                  SekoTextFormField(
                    controller: videoLinkController,
                  ),
                ),
                SendPostItemRow(
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
