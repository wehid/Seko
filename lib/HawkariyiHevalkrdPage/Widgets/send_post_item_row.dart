import 'package:flutter/material.dart';

class SendPostItemRow extends StatelessWidget {
  final String title;
  final Widget trailing;

  const SendPostItemRow(
    this.title,
    this.trailing,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text("$title :"),
          const SizedBox(width: 10),
          Expanded(child: trailing),
        ],
      ),
    );
  }
}
