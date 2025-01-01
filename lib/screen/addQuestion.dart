import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_quiz/questionClass.dart';

import '../color.dart';

class addQuestion extends StatefulWidget {
  const addQuestion({super.key});

  @override
  State<addQuestion> createState() => _addQuestionState();
}

class _addQuestionState extends State<addQuestion> {
  bool loaded = true;
  bool sttrue = true, ndtrue = false, rdtrue = false, thtrue = false;
  Color stcol = Color.fromARGB(255, 70, 26, 66);
  Color ndcol = Color.fromARGB(255, 70, 26, 66);
  Color rdcol = Color.fromARGB(255, 70, 26, 66);
  Color thcol = Color.fromARGB(255, 70, 26, 66);
  final questionTitle = TextEditingController();
  final stchoice = TextEditingController();
  final ndchoice = TextEditingController();
  final rdchoice = TextEditingController();
  final thchoice = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   setState(() {
  //     questionpurple = Color.fromARGB(255, 70, 26, 66);
  //     questionBlue = Color.fromARGB(255, 45, 112, 174);
  //     questionYellow = Color.fromARGB(255, 255, 164, 2);
  //     questionGreen = Color.fromARGB(255, 45, 157, 166);
  //     questionPink = Color.fromARGB(255, 213, 84, 109);
  //     optionBorder = Color.fromARGB(255, 160, 118, 204);
  //     border = Color.fromARGB(255, 183, 54, 118);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 51, 19, 48),
        appBar: AppBar(
          backgroundColor: purple,
          foregroundColor: foreground,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
              child: loaded
                  ? Column(
                      children: [
                        Focus(
                          onFocusChange: (hasFocus) {
                            if (hasFocus) {
                              setState(() {
                                questionpurple =
                                    Color.fromARGB(255, 50, 16, 47);
                              });
                            } else {
                              setState(() {
                                questionpurple =
                                    Color.fromARGB(255, 70, 26, 66);
                              });
                            }
                          },
                          child: TextFormField(
                            maxLines: 4,
                            controller: questionTitle,
                            autocorrect: true,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              filled: true,
                              fillColor: questionpurple,
                              hintText: 'Type your Question here...',
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
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Focus(
                              onFocusChange: (hasFocus) {
                                if (hasFocus) {
                                  setState(() {
                                    questionBlue =
                                        Color.fromARGB(255, 37, 87, 138);
                                  });
                                } else {
                                  setState(() {
                                    questionBlue =
                                        Color.fromARGB(255, 45, 112, 174);
                                  });
                                }
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width *
                                    75 /
                                    100,
                                decoration: BoxDecoration(
                                    color: questionBlue,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    controller: stchoice,
                                    autocorrect: true,
                                    maxLines: 1,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(color: Colors.white),
                                      filled: true,
                                      fillColor: questionBlue,
                                      hintText: 'Type an answer option here...',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: questionBlue, width: 6),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: optionBorder, width: 4),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 25 / 100 -
                                      16,
                              child: RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    sttrue = true;
                                    ndtrue = false;
                                    rdtrue = false;
                                    thtrue = false;
                                    stcol = Colors.green;
                                    ndcol = Color.fromARGB(255, 70, 26, 66);
                                    rdcol = Color.fromARGB(255, 70, 26, 66);
                                    thcol = Color.fromARGB(255, 70, 26, 66);
                                  });
                                },
                                fillColor: Colors.white,
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  width: MediaQuery.of(context).size.width *
                                          15 /
                                          100 -
                                      16,
                                  height: MediaQuery.of(context).size.width *
                                          15 /
                                          100 -
                                      16,
                                  decoration: new BoxDecoration(
                                    color: stcol,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                padding: EdgeInsets.all(8.0),
                                shape: CircleBorder(),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Container(
                              width:
                                  MediaQuery.of(context).size.width * 75 / 100,
                              child: Focus(
                                onFocusChange: (hasFocus) {
                                  if (hasFocus) {
                                    setState(() {
                                      questionGreen =
                                          Color.fromARGB(255, 36, 124, 130);
                                    });
                                  } else {
                                    setState(() {
                                      questionGreen =
                                          Color.fromARGB(255, 45, 157, 166);
                                    });
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: questionGreen,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.white),
                                      controller: ndchoice,
                                      autocorrect: true,
                                      maxLines: 1,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        filled: true,
                                        fillColor: questionGreen,
                                        hintText:
                                            'Type an answer option here...',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: questionGreen, width: 6),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: optionBorder, width: 4),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 25 / 100 -
                                      16,
                              child: RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    sttrue = false;
                                    ndtrue = true;
                                    rdtrue = false;
                                    thtrue = false;
                                    stcol = Color.fromARGB(255, 70, 26, 66);
                                    ndcol = Colors.green;
                                    rdcol = Color.fromARGB(255, 70, 26, 66);
                                    thcol = Color.fromARGB(255, 70, 26, 66);
                                  });
                                },
                                fillColor: Colors.white,
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  width: MediaQuery.of(context).size.width *
                                          15 /
                                          100 -
                                      16,
                                  height: MediaQuery.of(context).size.width *
                                          15 /
                                          100 -
                                      16,
                                  decoration: new BoxDecoration(
                                    color: ndcol,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                padding: EdgeInsets.all(8.0),
                                shape: CircleBorder(),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Container(
                              width:
                                  MediaQuery.of(context).size.width * 75 / 100,
                              child: Focus(
                                onFocusChange: (hasFocus) {
                                  if (hasFocus) {
                                    setState(() {
                                      questionYellow =
                                          Color.fromARGB(255, 217, 137, 0);
                                    });
                                  } else {
                                    setState(() {
                                      questionYellow =
                                          Color.fromARGB(255, 255, 164, 2);
                                    });
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: questionYellow,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.white),
                                      controller: rdchoice,
                                      autocorrect: true,
                                      maxLines: 1,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        filled: true,
                                        fillColor: questionYellow,
                                        hintText:
                                            'Type an answer option here...',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: questionYellow, width: 6),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: optionBorder, width: 4),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 25 / 100 -
                                      16,
                              child: RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    sttrue = false;
                                    ndtrue = false;
                                    rdtrue = true;
                                    thtrue = false;
                                    stcol = Color.fromARGB(255, 70, 26, 66);
                                    ndcol = Color.fromARGB(255, 70, 26, 66);
                                    rdcol = Colors.green;
                                    thcol = Color.fromARGB(255, 70, 26, 66);
                                  });
                                },
                                fillColor: Colors.white,
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  width: MediaQuery.of(context).size.width *
                                          15 /
                                          100 -
                                      16,
                                  height: MediaQuery.of(context).size.width *
                                          15 /
                                          100 -
                                      16,
                                  decoration: new BoxDecoration(
                                    color: rdcol,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                padding: EdgeInsets.all(8.0),
                                shape: CircleBorder(),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 75 / 100,
                              child: Focus(
                                onFocusChange: (hasFocus) {
                                  if (hasFocus) {
                                    setState(() {
                                      questionPink =
                                          Color.fromARGB(255, 155, 62, 80);
                                    });
                                  } else {
                                    setState(() {
                                      questionPink =
                                          Color.fromARGB(255, 213, 84, 109);
                                    });
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: questionPink,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.white),
                                      controller: thchoice,
                                      autocorrect: true,
                                      maxLines: 1,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        filled: true,
                                        fillColor: questionPink,
                                        hintText:
                                            'Type an answer option here...',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: questionPink, width: 6),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: optionBorder, width: 4),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 25 / 100 -
                                      16,
                              child: RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    sttrue = true;
                                    ndtrue = false;
                                    rdtrue = false;
                                    thtrue = false;
                                    stcol = Color.fromARGB(255, 70, 26, 66);
                                    ndcol = Color.fromARGB(255, 70, 26, 66);
                                    rdcol = Color.fromARGB(255, 70, 26, 66);
                                    thcol = Colors.green;
                                  });
                                },
                                elevation: 2.0,
                                fillColor: Colors.white,
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  width: MediaQuery.of(context).size.width *
                                          15 /
                                          100 -
                                      16,
                                  height: MediaQuery.of(context).size.width *
                                          15 /
                                          100 -
                                      16,
                                  decoration: new BoxDecoration(
                                    color: thcol,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                padding: EdgeInsets.all(8.0),
                                shape: CircleBorder(),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              questionpurple = Color.fromARGB(255, 70, 26, 66);
                              questionBlue = Color.fromARGB(255, 45, 112, 174);
                              questionYellow = Color.fromARGB(255, 255, 164, 2);
                              questionGreen = Color.fromARGB(255, 45, 157, 166);
                              questionPink = Color.fromARGB(255, 213, 84, 109);
                              optionBorder = Color.fromARGB(255, 160, 118, 204);
                              border = Color.fromARGB(255, 183, 54, 118);
                            });
                            if (questionTitle.text.isEmpty) {
                              setState(() {
                                questionTitle.text = "Your question";
                              });
                            }
                            if (stchoice.text.isEmpty) {
                              setState(() {
                                stchoice.text = "Null1";
                              });
                              print("stchoice is empty${stchoice.text}");
                            }
                            if (ndchoice.text.isEmpty) {
                              setState(() {
                                ndchoice.text = "Null2";
                              });
                              print("ndchoice is empty${ndchoice.text}");
                            }
                            if (rdchoice.text.isEmpty) {
                              setState(() {
                                rdchoice.text = "Null3";
                              });
                              print("rdchoice is empty${rdchoice.text}");
                            }
                            if (thchoice.text.isEmpty) {
                              setState(() {
                                thchoice.text = "Null4";
                              });
                              print("thchoice is empty${thchoice.text}");
                            }
                            Map<String, bool> option = {
                              stchoice.text: sttrue,
                              ndchoice.text: ndtrue,
                              rdchoice.text: rdtrue,
                              thchoice.text: thtrue,
                            }; //alasan kenapa yang kepilih cuma 1 dan paling terakhir karena error, kalau Map itu gaboleh 2 hal yang sama, problem solved
                            print("add question option: $option");
                            var returndata = {
                              "title": questionTitle.text,
                              "options": option
                            };
                            Navigator.pop(context, returndata);
                          },
                          child: Text("Insert Question",
                              style: TextStyle(color: Colors.white)),
                          minWidth: 200,
                          height: 40,
                        )
                      ],
                    )
                  : CircularProgressIndicator()),
        ),
      ),
    );
  }
}
