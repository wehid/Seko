import 'package:flutter/material.dart';

class PastAnswerText extends StatelessWidget {
  final String answer;

  PastAnswerText(this.answer);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      // height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Text(answer,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }
}
