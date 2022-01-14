import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

import '../Models/ProviderModel/squad_provider.dart';
import '../Models/ObjectModels/squad.dart';
import '../Models/ObjectModels/squad_member.dart';
import 'Widgets/squad_banner.dart';

import 'Componants/members_grid.dart';

enum SquadBody {
  endaman,
  chalaki,
}

class SquadScreen extends StatefulWidget {
  static const routeName = '/squad-screen';

  @override
  State<SquadScreen> createState() => _SquadScreenState();
}

class _SquadScreenState extends State<SquadScreen> {
  SquadBody currentBody = SquadBody.chalaki;

  List<SquadMember> squadMembers;
  Squad squad;
  SquadProvider squadProvider;

  @override
  void initState() {
    squadProvider = Provider.of<SquadProvider>(context, listen: false);
    squad = squadProvider.mySquad;
    squadMembers = squad.members;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("گرووپی من"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SquadBanner(squad.title),
            SizedBox(height: 400, child: MembersGrid(squad)),
          ],
        ),
      ),
    );
  }
}
