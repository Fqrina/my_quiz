import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_quiz/widget/appBar.dart';
import 'package:my_quiz/widget/dataShow.dart';
import 'package:my_quiz/widget/historyQuiz.dart';
import 'package:my_quiz/widget/lateAnnouncement.dart';

import '../color.dart';
import '../questionClass.dart';
import '../widget/availableQuiz.dart';
import '../widget/nextButton.dart';
import '../widget/questionWidget.dart';
import '../widget/optionCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//   Query myDatabase = FirebaseDatabase.instance
//       .ref()
//       .child('/exampleavailable/-NZZk6RdohG8JohiNwzN/questionsMap');
//   DatabaseReference dbRef = FirebaseDatabase.instance
//       .reference()
//       .child('/exampleavailable/-NZZk6RdohG8JohiNwzN/questionsMap');

  // Future<List<dynamic>> getDatabase() async {
  //   DatabaseEvent event = await dbRef.once();
  //   DataSnapshot snapshot = event.snapshot;

  //   List<dynamic> availableQuizArray = [];

  //   if (snapshot.value != null) {
  //     Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
  //     data.forEach((key, value) {
  //       availableQuizArray.add(value);
  //     });
  //   } else {
  //     print("database null");
  //   }

  //   return availableQuizArray;
  // }

  late List<dynamic> databaseArray;
  bool databaseloaded = false;

  @override
  void initState() {
    super.initState();
    // getDatabase().then((List<dynamic> quizArray) {
    //   setState(() {
    //     databaseArray = quizArray;
    //     databaseloaded = true;
    //     print("databasearray: $databaseArray");
    //   });
    //   print("quiziziziz: ${databaseArray[index]["options"]}");
    // }).catchError((error) {
    //   print("database error: $error");
    // });
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
        isAlreadyPressed = false;
        index++;
        isPressed = false;
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
        isAlreadyPressed = true;
        isPressed = true;
        finalscore = score / questionLength * 100;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 51, 19, 48),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NewBar(),
                const MyAnnounce(),
                const DataShow(),
                const AvailableQuiz(),
                const HistoryQuiz(),
                GestureDetector(
                  onTap: () => restart(),
                  child: Container(
                      width: double.infinity,
                      color: purple,
                      child: Text(
                        "Restart",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      width: double.infinity,
                      color: purple,
                      child: Text(
                        "add question",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                ),
                databaseloaded
                    ? QuestionWidget(
                        quesiton: databaseArray[index]["title"] == null
                            ? "null"
                            : databaseArray[index]["title"],
                        totalQuestion: databaseArray.length == null
                            ? 0
                            : databaseArray.length,
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
                                  option: databaseArray[index][
                                          "options"] //baru perkiraan tapi kayaknya itu karena options: [{}] bukan options: {}
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
                Text(
                  "$finalscore",
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
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

  // @override
  // Widget checkAvaib({required Map data}) {
  //   return Container(
  //       width: double.infinity,
  //       color: foreground,
  //       child: Text(
  //         "",
  //         style: TextStyle(color: Colors.white, fontSize: 20),
  //       ));
  // }
}
