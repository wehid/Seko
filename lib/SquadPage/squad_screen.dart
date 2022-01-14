import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

import '../Models/ProviderModel/squad_provider.dart';
import '../Models/ProviderModel/user_provider.dart';
import '../Models/ObjectModels/squad.dart';
import '../Models/ObjectModels/squad_member.dart';
import '../Models/ObjectModels/squad_activity.dart';
import 'Widgets/squad_banner.dart';

import 'Componants/members_grid.dart';
import 'Componants/activities_grid.dart';

enum SquadBody {
  members,
  activities,
}

class SquadScreen extends StatefulWidget {
  static const routeName = '/squad-screen';

  @override
  State<SquadScreen> createState() => _SquadScreenState();
}

class _SquadScreenState extends State<SquadScreen> {
  SquadBody currentBody = SquadBody.activities;

  List<SquadMember> squadMembers;
  List<SquadActivity> squadActivities;
  Squad squad;
  SquadProvider squadProvider;

  bool _firstRun = true;

  @override
  void didChangeDependencies() {
    if (_firstRun) {
      squadProvider = Provider.of<SquadProvider>(context);
      squad = squadProvider.mySquad;
      squadMembers = squad.members;

      final userToken = Provider.of<UserProvider>(context, listen: false).token;
      squadProvider.searchSquadActivity(squad.id, userToken);
      _firstRun = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    squadActivities = squadProvider.squadActivityList;

    return Scaffold(
      appBar: customAppBar("گرووپی من"),
      body: squadProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                SquadBanner(squad.title),
                // Expanded(child: MembersGrid(squad)),
                Expanded(child: ActivitiesGrid(squadActivities)),
              ],
            ),
    );
  }
}
