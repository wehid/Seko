import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../GlobalWidgets/seko_button.dart';

class QuizBottom extends StatelessWidget {
  final bool isFirstQuestion;
  final bool isLastQuestion;
  final bool isAnsweredBefore;
  final Function goToNext;
  final Function goToPrevious;
  final Function sendExam;

  QuizBottom({
    this.isFirstQuestion,
    this.isLastQuestion,
    this.goToNext,
    this.goToPrevious,
    this.isAnsweredBefore,
    this.sendExam
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Row(
        children: [
          if (!isFirstQuestion)
            IconButton(
              onPressed: goToPrevious,
              icon: Icon(
                Icons.chevron_left,
                color: questionColor,
                size: 40,
              ),
            ),
          Spacer(),
          if(!isLastQuestion)
            IconButton(
              onPressed: goToNext,
              icon: Icon(
                Icons.chevron_right,
                color: questionColor,
                size: 40,
              ),
            ),
          if(isLastQuestion && !isAnsweredBefore)
            SekoButton(
              onPressed: sendExam,
              buttonString: 'ناردن',
              buttonIcon: Icons.save,
              textColor: Colors.white,
              backgroundColor: Colors.green,
            ),
        ],
      ),
    );
  }
}
