import 'package:flutter/material.dart';

import '../../Models/ObjectModels/squad_member.dart';

class MemberViewWidget extends StatelessWidget {
  final SquadMember squadMember;
  final bool isThisSupervisor;

  const MemberViewWidget(this.squadMember, this.isThisSupervisor);

  bool _isMemberImageEmpty() {
    if (squadMember.memberImagePath == null ||
        squadMember.memberImagePath == "") {
      return true;
    }
    return false;
  }

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
          CircleAvatar(
              radius: 40,
              backgroundImage: !_isMemberImageEmpty()
                  ? NetworkImage(squadMember.memberImagePath)
                  : null,
              backgroundColor: Colors.transparent,
              child: _isMemberImageEmpty()
                  ? Icon(
                      Icons.person,
                      size: 55,
                      color: Colors.blue,
                    )
                  : null),
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
