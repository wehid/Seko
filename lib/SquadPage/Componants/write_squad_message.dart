import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../Models/ProviderModel/user_provider.dart';
import '../../Models/ProviderModel/squad_provider.dart';
import '../../Models/ObjectModels/squad_activity.dart';
import '../../GlobalWidgets/send_comment_widget.dart';

class WriteSquadMessage extends StatefulWidget {
  @override
  _WriteSquadMessageState createState() => _WriteSquadMessageState();
}

class _WriteSquadMessageState extends State<WriteSquadMessage> {
  static const MESSAGE_ACTIVITY_TYPE = "1";
  TextEditingController _messageController;

  @override
  void initState() {
    _messageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  String _emptyMessageValidator(String message) {
    if (message == null || message.isEmpty) {
      return "پێویستە لە پێشدا بۆچوونەکەت بنووسی";
    }
    return null;
  }

  void _sendSquadMesasge() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final squadProvider = Provider.of<SquadProvider>(context, listen: false);
    SquadActivity messageActivity = SquadActivity(
      squadId: squadProvider.mySquad.userId,
      userId: userProvider.user.id,
      activityType: MESSAGE_ACTIVITY_TYPE,
      title: "",
      message: _messageController.text,
    );

    squadProvider
        .sendSquadActivity(messageActivity, userProvider.token)
        .then((_) => _messageController.text = "");
  }

  @override
  Widget build(BuildContext context) {
    return SendCommentWidget(
      commentController: _messageController,
      emptyCommentValidator: _emptyMessageValidator,
      sendComment: _sendSquadMesasge,
    );
  }
}
