import 'package:flutter/material.dart';

import '../squad_menu_option_item.dart';
import '../Widgets/squad_option_widget.dart';

class OptionGrid extends StatelessWidget {
  final bool isShowActivities;
  final Function(bool) changeShowBody;
  OptionGrid(this.isShowActivities, this.changeShowBody);

  List<SquadMenuOptionItem> getMenuItems() {
    return [
      SquadMenuOptionItem(
        iconPath: isShowActivities
            ? "assets/images/activity_active.png"
            : "assets/images/activity.png",
        title: "چالاکی",
        isThisActivities: true,
      ),
      SquadMenuOptionItem(
        iconPath: !isShowActivities
            ? "assets/images/dashboard_active.png"
            : "assets/images/dashboard.png",
        title: "ئەندامان",
        isThisActivities: false,
      ),
      SquadMenuOptionItem(
          iconPath: "assets/images/fileupload.png", title: "ناردنی فایل"),
      SquadMenuOptionItem(
          iconPath: "assets/images/meeting.png", title: "سازدانی دیدار"),
    ];
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children:
            getMenuItems().map((item) => SquadOptionWidget(item, changeShowBody)).toList(),
      ),
    );
  }
}
