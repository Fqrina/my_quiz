import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_quiz/color.dart';
import 'package:my_quiz/screen/addQuestion.dart';

class AddQuiz extends StatefulWidget {
  const AddQuiz({super.key});

  @override
  State<AddQuiz> createState() => _AddQuizState();
}

class _AddQuizState extends State<AddQuiz> {
  var r = Random();
  String randomString() {
    return String.fromCharCodes(
        List.generate(5, (index) => r.nextInt(26) + 97));
  }

  late DatabaseReference dbref;
  late Map<dynamic, dynamic>
      quizRay; //kemungkinan error karena program so far harus list array [] bukan map {}
  final quizName = TextEditingController();
  String aa = "aa";
  String bb = "bb";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbref = FirebaseDatabase.instance.ref().child('exampleavailable');
    quizRay = {"quizName": quizName.text};
  }

  // List questionArray = [];
  Map<dynamic, dynamic> questionArray = {};
  var addData = {};
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 51, 19, 48),
        appBar: AppBar(
          foregroundColor: foreground,
          backgroundColor: purple,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Focus(
                  onFocusChange: (hasFocus) {
                    if (hasFocus) {
                      setState(() {
                        questionpurple = const Color.fromARGB(255, 50, 16, 47);
                      });
                    } else {
                      setState(() {
                        questionpurple = const Color.fromARGB(255, 70, 26, 66);
                      });
                    }
                  },
                  child: TextFormField(
                    maxLines: 1,
                    controller: quizName,
                    autocorrect: true,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor: questionpurple,
                      hintText: 'Type your Quiz name here...',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: purple, width: 6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: border, width: 4),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  child: const Text(
                    "reset array",
                  ),
                  onTap: () {
                    setState(() {
                      questionArray.clear();
                    });
                    print("new array $questionArray");
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: questionArray.length,
                    itemBuilder: (BuildContext context, index) {
                      print(
                          "listview: ${questionArray.values.elementAt(index)["options"].keys.elementAt(0)}"); //pake ini
                      print("listview: ${questionArray.keys.elementAt(index)}");
                      final value = questionArray.values.elementAt(
                          index); //coba kalau delete make function contain key aja
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: index % 4 == 0
                              ? questionBlue
                              : index % 4 == 1
                                  ? questionGreen
                                  : index % 4 == 2
                                      ? questionYellow
                                      : index % 4 == 3
                                          ? questionPink
                                          : Colors.black,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      questionArray.remove(
                                          questionArray.keys.elementAt(index));
                                    });
                                  },
                                  child: const Icon(
                                    Icons.highlight_remove_outlined,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                ),
                              ),
                              Text(
                                value[
                                    "title"], //wrap with column, pertama icon dgn align kanan atas, lalu value title ini, lalu "option:" row jawabannya
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const Text(
                                "Option: ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: index % 4 == 0
                                            ? const Color.fromARGB(
                                                255, 37, 87, 138)
                                            : index % 4 == 1
                                                ? const Color.fromARGB(
                                                    255, 36, 124, 130)
                                                : index % 4 == 2
                                                    ? const Color.fromARGB(
                                                        255, 217, 137, 0)
                                                    : index % 4 == 3
                                                        ? const Color.fromARGB(
                                                            255, 155, 62, 80)
                                                        : Colors.black,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            questionArray.values
                                                .elementAt(index)["options"]
                                                .keys
                                                .elementAt(0),
                                            style: const TextStyle(
                                              color: Colors.white,
                                            )),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                            15 /
                                            100 -
                                        16,
                                    height: MediaQuery.of(context).size.width *
                                            10 /
                                            100 -
                                        16,
                                    decoration: new BoxDecoration(
                                      color: questionArray.values
                                                  .elementAt(index)["options"]
                                                  .values
                                                  .elementAt(0) ==
                                              true
                                          ? Colors.green
                                          : const Color.fromARGB(
                                              255, 70, 26, 66),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: index % 4 == 0
                                            ? const Color.fromARGB(
                                                255, 37, 87, 138)
                                            : index % 4 == 1
                                                ? const Color.fromARGB(
                                                    255, 36, 124, 130)
                                                : index % 4 == 2
                                                    ? const Color.fromARGB(
                                                        255, 217, 137, 0)
                                                    : index % 4 == 3
                                                        ? const Color.fromARGB(
                                                            255, 155, 62, 80)
                                                        : Colors.black,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            questionArray.values
                                                .elementAt(index)["options"]
                                                .keys
                                                .elementAt(1),
                                            style: const TextStyle(
                                              color: Colors.white,
                                            )),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                            15 /
                                            100 -
                                        16,
                                    height: MediaQuery.of(context).size.width *
                                            10 /
                                            100 -
                                        16,
                                    decoration: new BoxDecoration(
                                      color: questionArray.values
                                                  .elementAt(index)["options"]
                                                  .values
                                                  .elementAt(1) ==
                                              true
                                          ? Colors.green
                                          : const Color.fromARGB(
                                              255, 70, 26, 66),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: index % 4 == 0
                                            ? const Color.fromARGB(
                                                255, 37, 87, 138)
                                            : index % 4 == 1
                                                ? const Color.fromARGB(
                                                    255, 36, 124, 130)
                                                : index % 4 == 2
                                                    ? const Color.fromARGB(
                                                        255, 217, 137, 0)
                                                    : index % 4 == 3
                                                        ? const Color.fromARGB(
                                                            255, 155, 62, 80)
                                                        : Colors.black,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            questionArray.values
                                                .elementAt(index)["options"]
                                                .keys
                                                .elementAt(2),
                                            style: const TextStyle(
                                              color: Colors.white,
                                            )),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                            15 /
                                            100 -
                                        16,
                                    height: MediaQuery.of(context).size.width *
                                            10 /
                                            100 -
                                        16,
                                    decoration: new BoxDecoration(
                                      color: questionArray.values
                                                  .elementAt(index)["options"]
                                                  .values
                                                  .elementAt(2) ==
                                              true
                                          ? Colors.green
                                          : const Color.fromARGB(
                                              255, 70, 26, 66),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: index % 4 == 0
                                            ? const Color.fromARGB(
                                                255, 37, 87, 138)
                                            : index % 4 == 1
                                                ? const Color.fromARGB(
                                                    255, 36, 124, 130)
                                                : index % 4 == 2
                                                    ? const Color.fromARGB(
                                                        255, 217, 137, 0)
                                                    : index % 4 == 3
                                                        ? const Color.fromARGB(
                                                            255, 155, 62, 80)
                                                        : Colors.black,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            questionArray.values
                                                .elementAt(index)["options"]
                                                .keys
                                                .elementAt(3),
                                            style: const TextStyle(
                                              color: Colors.white,
                                            )),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                            15 /
                                            100 -
                                        16,
                                    height: MediaQuery.of(context).size.width *
                                            10 /
                                            100 -
                                        16,
                                    decoration: new BoxDecoration(
                                      color: questionArray.values
                                                  .elementAt(index)["options"]
                                                  .values
                                                  .elementAt(3) ==
                                              true
                                          ? Colors.green
                                          : const Color.fromARGB(
                                              255, 70, 26, 66),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Visibility(
                  visible: visible,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.red,
                    ),
                    height: 64,
                    width: double.infinity,
                    child: Center(
                      child: Text("You cant have quiz with 0 questions!",
                          style: GoogleFonts.robotoCondensed(
                            textStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          )),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () async {
                        final option = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const addQuestion()),
                        );
                        setState(() {
                          print("addQuiz option: $option");
                          if (option != null) {
                            questionArray[randomString()] = option;
                            visible = false;
                          } else {}
                          print("addQuiz array: ${questionArray}");
                          print(questionArray.entries
                              .elementAt(0)
                              .toString()); //kalau gabisa gini coba, pake foreach.Key, masukin ke 1 array, terus kalau mau load
                          //listviewnya pake for each values at the array, cari di Map, terus baru di masukin ke widget
                          addData = {
                            "title": quizName.text,
                            "options": questionArray
                          };
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1 / 2,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "Add question",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: purple,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: MaterialButton(
                    onPressed: () {
                      if (questionArray.length > 0) {
                        Map<dynamic, dynamic> todb = {
                          "questionsMap": questionArray
                        };
                        if (quizName.text.isEmpty) {
                          quizName.text = "Your Quiz";
                        }
                        setState(() {
                          todb["quizName"] = quizName.text;
                        });
                        dbref.push().set(todb);

                        Navigator.pop(context);
                      } else {
                        setState(() {
                          print("abcdefg");
                          visible = true;
                        });
                      }
                    },
                    child: const Text(
                      "Insert Quiz",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    minWidth: 200,
                    height: 40,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
