import 'package:flutter/material.dart';

class SekoButton extends StatelessWidget {
  final Color borderColor;
  final Color backgroundColor;
  final Function onPressed;
  final String buttonString;
  final IconData buttonIcon;
  final Color textColor;

  SekoButton({
    this.borderColor = Colors.grey,
    this.backgroundColor = Colors.white,
    this.onPressed,
    this.buttonString,
    this.buttonIcon,
    this.textColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: borderColor, width: 2),
        color: backgroundColor,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              buttonString,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: textColor),
            ),
            Icon(buttonIcon, size: 30, color: textColor,),
          ],
        ),
      ),
    );
  }
}
