import 'package:flutter/material.dart';

import '../squad_menu_option_item.dart';

class SquadOptionWidget extends StatelessWidget {
  final SquadMenuOptionItem menuOption;
  final Function(bool) changeShowBody;

  const SquadOptionWidget(this.menuOption, this.changeShowBody);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> changeShowBody(menuOption.isThisActivities),
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              width: 30,
              height: 30,
              child: Image.asset(menuOption.iconPath),
            ),
            const SizedBox(height: 5),
            Text(
              menuOption.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
