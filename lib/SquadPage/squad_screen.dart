import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/ProviderModel/squad_provider.dart';
import '../Models/ProviderModel/user_provider.dart';
import '../Models/ObjectModels/squad.dart';
import 'Widgets/squad_banner.dart';

import 'Componants/members_grid.dart';
import 'Componants/activities_grid.dart';
import 'Componants/option_gird.dart';
import 'Componants/write_squad_message.dart';

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
  SquadBody _currentBody = SquadBody.activities;
  Squad squad;
  SquadProvider squadProvider;

  bool showActivitiesInBody = true;
  bool _firstRun = true;

  changeShowBody(bool isShowActivity) {
    if (isShowActivity == null) return;
    if (isShowActivity == showActivitiesInBody) return;
    setState(() {
      showActivitiesInBody = isShowActivity;
    });
  }

  @override
  void didChangeDependencies() {
    if (_firstRun) {
      squadProvider = Provider.of<SquadProvider>(context);
      squad = squadProvider.mySquad;

      final userToken = Provider.of<UserProvider>(context, listen: false).token;
      squadProvider.searchSquadActivity(squad.id, userToken);
      _firstRun = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: squadProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(flex: 2, child: SquadBanner(squad.title)),
                    Flexible(
                      flex: 3,
                      child: OptionGrid(showActivitiesInBody, changeShowBody),
                    ),
                  ],
                ),
                const Divider(),
                Expanded(
                  child: showActivitiesInBody
                      ? ActivitiesGrid()
                      : MembersGrid(squad),
                ),
                WriteSquadMessage(),
              ],
            ),
    );
  }
}
