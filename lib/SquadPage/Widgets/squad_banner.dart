import 'package:flutter/material.dart';

class SquadBanner extends StatelessWidget {
  final String squadName;

  const SquadBanner(this.squadName);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.3;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.blue.shade600),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "گرووپی",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.amber,
              ),
            ),
            Text(
              squadName,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            )
          ],
        ),
      ),
    );
  }
}
