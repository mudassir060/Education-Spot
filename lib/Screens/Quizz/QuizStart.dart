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
          const myAppBar(titel: "Question No: 1", linewidth: 180),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const Card(
                  child: SizedBox(
                    height: 80,
                    width: 200,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "question",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
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
