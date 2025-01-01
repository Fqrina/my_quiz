import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_quiz/questionClass.dart';
import 'package:my_quiz/screen/homeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyQuiz());
}

class MyQuiz extends StatelessWidget {
  const MyQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}
