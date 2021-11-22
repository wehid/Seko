import 'package:flutter/material.dart';

class UserInformationWidget extends StatelessWidget {
  final String title;
  final String description;

  UserInformationWidget(this.title, this.description);

  @override
  Widget build(BuildContext context) {
    TextStyle myStyleTitle() {
      return TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    }

    TextStyle myStyleDescription() {
      return TextStyle(fontSize: 20);
    }

    return Container(
      margin: const EdgeInsets.all(15),
      child: Row(
        children: [
          Text('$title:', style: myStyleTitle()),
          SizedBox(width: 15),
          Expanded(child: Text(description, style: myStyleDescription())),
        ],
      ),
    );
  }
}
