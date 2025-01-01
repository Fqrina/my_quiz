import 'package:flutter/material.dart';
import 'package:my_quiz/questionClass.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    Key? key,
    required this.quesiton,
    required this.totalQuestion,
    required this.indexAction,
  }) : super(key: key);
  final String quesiton;
  final int indexAction;
  final int totalQuestion;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        "Question ${indexAction + 1}/$totalQuestion: $quesiton",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
    );
  }
}
