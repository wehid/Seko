import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

class OutlineLink extends StatelessWidget {
  final IconData icon;
  final String description;
  final String link;

  OutlineLink({
    @required this.icon,
    @required this.description,
    @required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(width: 5),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: description,
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launch(link);
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
