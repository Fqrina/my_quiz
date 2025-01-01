import 'package:flutter/material.dart';
import 'package:my_quiz/screen/addQuestion.dart';
import '../color.dart';
import '../screen/addQuiz.dart';

class NewBar extends StatelessWidget {
  const NewBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: purple,
      ),
      child: Row(
        children: [
          Container(
            child: Image.asset("images/profile.png", width: 48),
            padding: EdgeInsets.all(10),
          ),
          Expanded(
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text("Search Here"),
              ),
            ),
          ),
          SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddQuiz()),
              );
            },
            child: Container(
              height: 48,
              width: 48,
              child: Icon(Icons.search),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddQuiz()),
              );
            },
            child: Container(
              height: 48,
              width: 48,
              child: Center(
                child: Text(
                  "+",
                  style: TextStyle(fontSize: 32),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          SizedBox(width: 8),
        ],
      ),
    );
  }
}
