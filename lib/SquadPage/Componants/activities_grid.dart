import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ProviderModel/squad_provider.dart';
import '../../Models/ObjectModels/squad_activity.dart';
import '../Widgets/squad_activity_widget.dart';

class ActivitiesGrid extends StatelessWidget {
  Widget activitiesGridWidget(List<SquadActivity> squadActivities) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: squadActivities.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 5 / 6,
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5),
      itemBuilder: (context, index) {
        return SquadActivityWidget(squadActivities[index]);
      },
    );
  }

  Widget noActivityMessage() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          "مامۆستای هێژا، هیچ چالاکیەک ڕووی نەداوە",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SquadProvider squadProvider = Provider.of<SquadProvider>(context);
    List<SquadActivity> squadActivities = squadProvider.squadActivityList;

    return squadProvider.isLoadingActivities
        ? Center(child: CircularProgressIndicator())
        : squadActivities.length > 0
            ? activitiesGridWidget(squadActivities)
            : noActivityMessage();
  }
}
