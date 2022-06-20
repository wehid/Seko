import 'package:flutter/material.dart';

import '../../Models/ObjectModels/squad_member.dart';
import '../../GlobalWidgets/user_circle_avatar.dart';

class MemberViewWidget extends StatelessWidget {
  final SquadMember squadMember;
  final bool isThisSupervisor;

  const MemberViewWidget(this.squadMember, this.isThisSupervisor);

  TextStyle supervisorStyle() {
    return TextStyle(
        fontWeight: FontWeight.bold, color: Colors.green, fontSize: 20);
  }

  TextStyle memberStyle() {
    return TextStyle(color: Colors.black, fontSize: 20);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 70,
            width: 70,
            child: UserCirlceAvatar(squadMember.memberImagePath),
          ),
          const SizedBox(height: 5),
          Text(
            squadMember.memberName,
            style: isThisSupervisor ? supervisorStyle() : memberStyle(),
          ),
          const SizedBox(height: 5),
          Text(
            "(${squadMember.memberUsername})",
            style: isThisSupervisor ? supervisorStyle() : memberStyle(),
          ),
        ],
      ),
    );
  }
}
