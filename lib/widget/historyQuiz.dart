import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../color.dart';

class HistoryQuiz extends StatefulWidget {
  const HistoryQuiz({super.key});

  @override
  State<HistoryQuiz> createState() => _HistoryQuizState();
}

class _HistoryQuizState extends State<HistoryQuiz> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: purple,
                        width: 4,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            "Quiz History",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: purple,
                  ),
                  height: 64,
                  child: Center(
                    child: Text(
                      "No History Yet",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
