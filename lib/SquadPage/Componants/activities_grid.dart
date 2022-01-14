import 'package:flutter/material.dart';

import '../../Models/ObjectModels/squad_activity.dart';
import '../Widgets/squad_activity_widget.dart';

class ActivitiesGrid extends StatelessWidget {
  final List<SquadActivity> squadActivities;

  const ActivitiesGrid(this.squadActivities);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: squadActivities.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3 / 4,
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5),
      itemBuilder: (context, index) {
        return SquadActivityWidget(squadActivities[index]);
      },
    );
  }
}
