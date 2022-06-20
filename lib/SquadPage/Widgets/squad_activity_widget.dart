import 'package:flutter/material.dart';

import '../../Models/ObjectModels/squad_activity.dart';
import '../../GlobalWidgets/user_circle_avatar.dart';

class SquadActivityWidget extends StatelessWidget {
  final SquadActivity squadActivity;

  const SquadActivityWidget(this.squadActivity);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              squadActivity.activityDate,
              style: TextStyle(
                  color: Colors.green.shade800,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                SizedBox(
                  width: 35,
                  height: 35,
                  child: UserCirlceAvatar(squadActivity.userImagePath),
                ),
                SizedBox(width: 8),
                Text(
                  "${squadActivity.userName} ${squadActivity.userFamily}",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  squadActivity.message,
                  style: TextStyle(fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
