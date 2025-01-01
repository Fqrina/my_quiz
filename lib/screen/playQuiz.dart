import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../color.dart';
import '../widget/nextButton.dart';
import '../widget/optionCard.dart';
import '../widget/questionWidget.dart';

class PLayQuiz extends StatefulWidget {
  final String dbKey;
  PLayQuiz({Key? key, required this.dbKey}) : super(key: key);

  @override
  State<PLayQuiz> createState() => _PLayQuizState();
}

class _PLayQuizState extends State<PLayQuiz> {
  String get dbKey => widget.dbKey;
  late Query myDatabase;
  late DatabaseReference dbRef;

  Future<List<dynamic>> getDatabase() async {
    DatabaseEvent event = await dbRef.once();
    DataSnapshot snapshot = event.snapshot;

    List<dynamic> availableQuizArray = [];

    if (snapshot.value != null) {
      Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
      data.forEach((key, value) {
        availableQuizArray.add(value);
      });
    } else {
      print("database null");
    }

    return availableQuizArray;
  }

  late List<dynamic> databaseArray;
  bool databaseloaded = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      myDatabase = FirebaseDatabase.instance
          .ref()
          .child('exampleavailable/$dbKey/questionsMap');
      dbRef = FirebaseDatabase.instance
          .reference()
          .child('exampleavailable/$dbKey/questionsMap');
    });
    getDatabase().then((List<dynamic> quizArray) {
      setState(() {
        databaseArray = quizArray;
        print("playquiz databasearray: $databaseArray");
        databaseloaded = true;
      });
    }).catchError((error) {
      print("database error: $error");
    });
  }

  double finalscore = 0;
  double score = 0;
  int index = 0;
  bool isPressed = false;
  bool isAlreadyPressed = false;

  void restart() {
    setState(() {
      finalscore = 0;
      score = 0;
      index = 0;
      isPressed = false;
      isAlreadyPressed = false;
    });
  }

  void nextQuestion(int questionLength) {
    if (index == questionLength - 1) {
      return;
    } else {
      setState(() {
        index++;
        isPressed = false;
        isAlreadyPressed = false;
      });
    }
  }

  void checkTrueAnswer(bool value, int questionLength) {
    if (isAlreadyPressed) {
    } else {
      if (value == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadyPressed = false;
        finalscore = score / questionLength * 100;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          title: Text("Test Play Quiz"),
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              databaseloaded
                  ? QuestionWidget(
                      quesiton: databaseArray[index]["title"] ?? "null",
                      totalQuestion: databaseArray.length,
                      indexAction: index,
                    )
                  : Text("loading"),
              databaseloaded
                  ? Column(
                      children: [
                        for (int i = 0;
                            i < databaseArray[index]["options"].length;
                            i++)
                          GestureDetector(
                            onTap: () => checkTrueAnswer(
                                databaseArray[index]["options"]
                                    .values
                                    .toList()[i],
                                databaseArray.length),
                            child: OptionCard(
                                option: databaseArray[index]["options"]
                                    .keys
                                    .toList()[i],
                                color: isPressed
                                    ? databaseArray[index]["options"]
                                                .values
                                                .toList()[i] ==
                                            true
                                        ? correct
                                        : incorrect
                                    // ? Colors.green
                                    : neutral),
                          ),
                      ],
                    )
                  : Text("loading"),
            ],
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap: () => nextQuestion(databaseArray.length),
          child: NextButton(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
