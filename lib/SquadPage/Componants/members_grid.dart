import 'package:flutter/material.dart';

import '../../Models/ObjectModels/squad.dart';
import '../../Models/ObjectModels/squad_member.dart';

import '../Widgets/member_view_widget.dart';

class MembersGrid extends StatelessWidget {
  final _SUPERVISER_INDEX = 0;

  final Squad squad;

  const MembersGrid(this.squad);

  List<SquadMember> _membersWithSupervisor() {
    List<SquadMember> members = [];

    SquadMember supervisor = SquadMember(
      memberImage: squad.supervisorImage,
      memberImagePath: squad.supervisorImagePath,
      memberName: "${squad.supervisorName} ${squad.supervisorFamily}",
      memberUsername: squad.supervisorUsername,
    );

    members.add(supervisor);
    members.addAll(squad.members);
    return members;
  }

  @override
  Widget build(BuildContext context) {
    // List<SquadMember> membersWithSupervisor = _membersWithSupervisor();
    return GridView.builder(
      itemCount: _membersWithSupervisor().length,
      padding: const EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 3 / 4,
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) {
        return MemberViewWidget(
            _membersWithSupervisor()[index], index == _SUPERVISER_INDEX);
      },
    );
  }
}
