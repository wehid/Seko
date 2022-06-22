import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/ObjectModels/user_log.dart';
import '../Models/ProviderModel/user_provider.dart';
import '../GlobalWidgets/seko_button.dart';

import '../constants.dart';

class UserLogsScreen extends StatelessWidget {
  static const routeName = '/user-log-screen';

  bool _isNotSeenLog(UserLog log) {
    return log.seen == UNSEEN_LOG;
  }

  Icon notSeenIcon() {
    return Icon(Icons.visibility_off, color: Colors.red);
  }

  Icon seenedIcon() {
    return Icon(Icons.visibility, color: Colors.green);
  }

  @override
  Widget build(BuildContext context) {
    // if (_ifFirstLoad) _loadData(context);
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    List<UserLog> logs = userProvider.userLogs;
    print("user log screen rebuild");

    return Scaffold(
      appBar: customAppBar("پەیام و چالاکی"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: userProvider.isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: logs.length,
                      itemBuilder: (context, index) {
                        UserLog log = logs[index];
                        return Card(
                          elevation: 5,
                          child: ListTile(
                            onTap: _isNotSeenLog(log)
                                ? () =>
                                    userProvider.setLogAsReadByLogId(log.logId)
                                : null,
                            title: Text(log.message),
                            trailing: _isNotSeenLog(log)
                                ? notSeenIcon()
                                : seenedIcon(),
                          ),
                        );
                      },
                    ),
                  ),
                  if (userProvider.numberOfUnreadUserLog() > 0)
                    SekoButton(
                      backgroundColor: Colors.blue,
                      buttonString: "هەمووی ببینە",
                      buttonIcon: Icons.visibility,
                      textColor: Colors.white,
                      onPressed: () => userProvider.setAllLogAsSeen(),
                    )
                ],
              ),
      ),
    );
  }
}
