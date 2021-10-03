import 'package:flutter/material.dart';

class UserInformationWidget extends StatelessWidget {
  final String title;
  final String description;

  UserInformationWidget(this.title, this.description);

  @override
  Widget build(BuildContext context) {
    TextStyle myStyle() {
      return TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    }

    return Container(
      margin: const EdgeInsets.all(15),
      child: Row(
        children: [
          Text('$title:', style: myStyle()),
          SizedBox(width: 20),
          Text(description, style: myStyle()),
          Spacer(),
        ],
      ),
    );
  }
}
