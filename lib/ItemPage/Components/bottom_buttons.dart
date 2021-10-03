import 'package:flutter/material.dart';

import '../../GlobalWidgets/seko_button.dart';
import '../../constants.dart';

class BottomButtons extends StatelessWidget {
  final bool isReadedThisItem;
  final Function readingThisItem;
  final Function goToNext;
  final Function goToPrevious;

  BottomButtons({
    this.isReadedThisItem,
    this.readingThisItem,
    this.goToPrevious,
    this.goToNext,
  });

  @override
  Widget build(BuildContext context) {
    Color buttonsColor = isReadedThisItem ? readedItemColor : unReadeItemColor;

    return Row(
      children: [
        Flexible(
            flex: 15,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: IconButton(
                icon: Icon(Icons.chevron_left),
                onPressed: goToPrevious,
                color: buttonsColor,
                iconSize: 40,
              ),
            )),
        Flexible(
          flex: 65,
          child: SekoButton(
            textColor: Colors.white,
            buttonString: isReadedThisItem ? 'تەواوت کردوە' : 'تەواوم کرد',
            buttonIcon: isReadedThisItem ? Icons.done : Icons.thumb_up,
            backgroundColor: buttonsColor,
            onPressed: isReadedThisItem ? null : readingThisItem,
            borderColor: Colors.transparent,
          ),
        ),
        Flexible(
            flex: 15,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: IconButton(
                icon: Icon(Icons.chevron_right),
                onPressed: goToNext,
                color: buttonsColor,
                iconSize: 40,
              ),
            )),
      ],
    );
  }
}
