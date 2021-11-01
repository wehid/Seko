import 'package:flutter/material.dart';

import '../../constants.dart';

class QuestionNumberList extends StatefulWidget {
  final int numberOfQuestions;
  final Function(int) jumpToThePage;
  final int currentIndex;

  QuestionNumberList({
    this.numberOfQuestions,
    this.jumpToThePage,
    this.currentIndex,
  });

  @override
  _QuestionNumberListState createState() => _QuestionNumberListState();
}

class _QuestionNumberListState extends State<QuestionNumberList> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.numberOfQuestions,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              widget.jumpToThePage(index);
              setState(() {});
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color:
                    widget.currentIndex == index ? questionColor : Colors.transparent,
              ),
              child: Center(
                child: Text(
                  (index + 1).toString(),
                  style: TextStyle(
                    color: widget.currentIndex == index ? Colors.white : questionColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
