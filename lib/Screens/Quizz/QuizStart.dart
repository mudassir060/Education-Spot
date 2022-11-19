import 'dart:math';

import 'package:education_spot/Screens/Quizz/QuizQuestion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Widgets/myAppBar.dart';

class QuizStart extends StatefulWidget {
  final List data;

  const QuizStart({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<QuizStart> createState() => _QuizStartState();
}

class _QuizStartState extends State<QuizStart> {
  TextEditingController d_controlle = TextEditingController(text: "0");

  @override
  Widget build(BuildContext context) {
    Random rnd;
    int min = 0;
    int max = 9;
    rnd = Random();
    int r = min + rnd.nextInt(max - min);
    print("===================>${widget.data.length}");
    var data = widget.data[r];
    return SafeArea(
        // appBar: AppBar(
        //   title: const Text("Question No: 1"),
        // ),

        child: Scaffold(
      body: Column(
        children: [
          const myAppBar(titel: "Quiz", linewidth: 80),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Table(
                  defaultColumnWidth: FixedColumnWidth(170.0),
                  border: TableBorder.all(color: Colors.white, style: BorderStyle.solid, width: 2),
                  children: [
                    TableRow(children: [
                      container(
                        "TEST NAME",
                        Colors.grey[300],
                      ),
                      container(
                        "ECAT",
                        Colors.grey[300],
                      ),
                    ]),
                    TableRow(children: [
                      container(
                        "TEST CATEGORY",
                        Colors.grey[200],
                      ),
                      container(
                        "MULTI",
                        Colors.grey[200],
                      ),
                    ]),
                    TableRow(children: [
                      container(
                        "TEST TYPE",
                        Colors.grey[300],
                      ),
                      container(
                        "MCQS",
                        Colors.grey[300],
                      ),
                    ]),
                    TableRow(children: [
                      container(
                        "TOTAL QUESTION",
                        Colors.grey[200],
                      ),
                      container(
                        "10",
                        Colors.grey[200],
                      ),
                    ]),
                    TableRow(children: [
                      container(
                        "TOTAL TIME",
                        Colors.grey[300],
                      ),
                      container(
                        "10",
                        Colors.grey[300],
                      ),
                    ]),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuizQuestion(
                                  data: data,
                                  questioNo: 0,
                                  all_data: widget.data,
                                  scoure: 0,
                                )),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Start Quiz"),
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

Widget container(titel, color) {
  return Container(
    padding: const EdgeInsets.all(10.0),
    color: color,
    height: 50,
    child: Center(
        child: Row(
      children: [
        Text(titel, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
      ],
    )),
  );
}
