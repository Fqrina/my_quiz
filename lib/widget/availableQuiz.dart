import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:my_quiz/questionClass.dart';
import 'package:my_quiz/screen/playQuiz.dart';
import 'dart:math';

import '../color.dart';

class AvailableQuiz extends StatefulWidget {
  const AvailableQuiz({super.key});

  @override
  State<AvailableQuiz> createState() => _AvailableQuizState();
}

class _AvailableQuizState extends State<AvailableQuiz> {
  Query dbref = FirebaseDatabase.instance.ref().child('exampleavailable');
  DatabaseReference dbRef =
      FirebaseDatabase.instance.reference().child('exampleavailable');

  Future<List<dynamic>> getAvailableQuizAsArray() async {
    DatabaseReference dbRef =
        FirebaseDatabase.instance.reference().child('exampleavailable');
    DatabaseEvent event = await dbRef.once();
    DataSnapshot snapshot = event.snapshot;

    List<dynamic> availableQuizArray = [];
    late List<dynamic> forquestion = [];

    if (snapshot.value != null) {
      Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
      data.forEach((key, value) {
        availableQuizArray.add(value);
      });
    }

    return availableQuizArray;
  }

  bool isloaded = false;
  late List<dynamic> myavailable;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAvailableQuizAsArray().then((List<dynamic> quizArray) {
      setState(() {
        myavailable = quizArray;
        isloaded = true;
      });
      print("quizArray: ${myavailable}");
    }).catchError((error) {
      // Tangani kesalahan jika ada
      print(error);
    });
  }

  Map<dynamic, dynamic> aaaa = {};
  @override
  Widget makeList({required Map data}) {
    var rng = Random();
    print(rng.nextInt(4) + 1);

    // int index = rng.nextInt(3) + 1;
    // print("index: $index");
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PLayQuiz(
              dbKey: data["key"],
            ),
          ),
        );
      },
      child: Container(
        color: Colors.white,
        height: 112,
        width: 192,
        margin: EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: Text("${data["questionsMap"].length} Qs")),
                  GestureDetector(
                    onTap: () {
                      dbRef.child(data["key"]).remove();
                      print("removed");
                    },
                    child: const Icon(
                      Icons.highlight_remove_outlined,
                      color: Colors.red,
                      size: 20,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                      "quizName: ${data["quizName"]}, key: ${data['key']}, data: ${data["questionsMap"]}"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
              child: isloaded
                  ? Text(
                      "There are ${myavailable.length} Quiz available right now",
                      style: TextStyle(color: Colors.white),
                    )
                  : Text("aa")),
          Container(
            height: 112,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: purple,
            ),
            child: FirebaseAnimatedList(
              scrollDirection: Axis.horizontal,
              query: dbref,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                Map fetchDatas = snapshot.value as Map;
                print("fetchDatas: $fetchDatas");
                List<dynamic> thequestion = [];
                thequestion.add(fetchDatas);
                print("teslist: $thequestion");
                fetchDatas['key'] = snapshot.key;
                return makeList(data: fetchDatas);
              },
            ),
          ),
        ],
      ),
    );
  }
}
