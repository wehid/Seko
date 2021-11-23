import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/ObjectModels/user_log.dart';
import '../Models/ProviderModel/user_provider.dart';

class UserLogsScreen extends StatelessWidget {
  bool _ifFirstLoad = true;

  void _loadData(BuildContext context) {
    Provider.of<UserProvider>(context, listen: false).getUserLogs();
    _ifFirstLoad = false;
  }

  bool _isNotSeenLog(UserLog log) {
    return log.seen == "0";
  }

  Icon notSeenIcon() {
    return Icon(Icons.visibility_off, color: Colors.red);
  }

  Icon seenedIcon() {
    return Icon(Icons.visibility, color: Colors.green);
  }

  @override
  Widget build(BuildContext context) {
    if (_ifFirstLoad) _loadData(context);
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    List<UserLog> logs = userProvider.userLogs;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: logs.length,
          itemBuilder: (context, index) {
            UserLog log = logs[index];
            return Card(
              elevation: 5,
              child: ListTile(
                title: Text(log.message),
                trailing: _isNotSeenLog(log) ? notSeenIcon() : seenedIcon(),
              ),
            );
          },
        ),
      ),
    );
  }
}
