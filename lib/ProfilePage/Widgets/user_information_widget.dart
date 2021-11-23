import 'package:flutter/material.dart';

class UserInformationWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  UserInformationWidget({
    @required this.icon,
    @required this.title,
    @required this.description,
  });

  TextStyle myStyleTitle() {
    return TextStyle(fontSize: 15, color: Colors.grey);
  }

  TextStyle myStyleDescription() {
    return TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            child: Icon(icon),
          ),
          SizedBox(width: 25),
          Expanded(
            child: Container(
              height: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$title:', style: myStyleTitle()),
                  SizedBox(width: 5),
                  Text(description, style: myStyleDescription()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
