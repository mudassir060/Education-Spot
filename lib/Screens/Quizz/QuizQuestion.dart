import 'dart:math';

import 'package:education_spot/Widgets/myAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Widgets/mySpacer.dart';
import '../../constants/images.dart';
import '../../constants/style.dart';
import 'QuizEnd.dart';

class QuizQuestion extends StatefulWidget {
  final Map data;
  final List all_data;
  final int questioNo;
  final int scoure;

  const QuizQuestion({Key? key, required this.data, required this.questioNo, required this.all_data, required this.scoure})
      : super(key: key);

  @override
  State<QuizQuestion> createState() => _QuizQuestionState();
}

class _QuizQuestionState extends State<QuizQuestion> {
  TextEditingController d_controlle = TextEditingController(text: "0");
  TextEditingController s_controlle = TextEditingController(text: "0");

  @override
  Widget build(BuildContext context) {
    Random rnd;
    var que = widget.questioNo + 1;
    int min = que * 10 - 10;
    int max = que * 10 - 1;
    rnd = Random();
    int r = min + rnd.nextInt(max - min);
    var scoure = widget.scoure;

    var vwidth = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          // // // // // // // // // // // Top Bar // // // // // // // // //
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Image.asset(curve),
                  Positioned(
                    top: 25,
                    left: 25,
                    child: Text(
                      "$scoure /10",
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                ],
              ),
              mySpacer(0.0, 0.0),
              Column(
                children: [
                  Text(
                    "Question ${widget.questioNo + 1}",
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  mySpacer(10.0, 0.0),
                  Container(
                    width: 140,
                    height: 2,
                    color: primaryColor,
                  )
                ],
              ),
              mySpacer(0.0, 0.0),
              mySpacer(0.0, 0.0),
            ],
          ),
          // // // // // // // // // // // Question // // // // // // // // //

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Card(
                  child: SizedBox(
                    height: 80,
                    width: vwidth,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${widget.data["question"]}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                OptionCard(
                  option: "A: ${widget.data["A"]}",
                  index: 1,
                  d_controlle: d_controlle,
                  s_controlle: s_controlle,
                  C_index: widget.data["correctIndex"],
                ),
                OptionCard(
                  option: "B: ${widget.data["B"]}",
                  index: 2,
                  d_controlle: d_controlle,
                  s_controlle: s_controlle,
                  C_index: widget.data["correctIndex"],
                ),
                OptionCard(
                  option: "C: ${widget.data["C"]}",
                  index: 3,
                  d_controlle: d_controlle,
                  s_controlle: s_controlle,
                  C_index: widget.data["correctIndex"],
                ),
                OptionCard(
                  option: "D: ${widget.data["D"]}",
                  index: 4,
                  d_controlle: d_controlle,
                  s_controlle: s_controlle,
                  C_index: widget.data["correctIndex"],
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (s_controlle.text == '1') {
                        setState(() {
                          scoure++;
                        });
                      }
                      if (widget.questioNo != 9) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuizQuestion(
                                    data: widget.all_data[r],
                                    questioNo: widget.questioNo + 1,
                                    all_data: widget.all_data,
                                    scoure: scoure,
                                  )),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuizEnd(
                                    scoure: scoure,
                                  )),
                        );
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Next"),
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

class OptionCard extends StatefulWidget {
  final TextEditingController d_controlle;
  final TextEditingController s_controlle;
  final String option;
  final int index;
  final int C_index;

  const OptionCard(
      {Key? key, required this.option, required this.index, required this.d_controlle, required this.C_index, required this.s_controlle})
      : super(key: key);

  @override
  State<OptionCard> createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  var color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          if (widget.d_controlle.text == "0") {
            widget.d_controlle.text = "1";
            if (widget.C_index == widget.index) {
              widget.s_controlle.text = "1";
              setState(() {
                color = Colors.greenAccent.shade100;
              });
            } else {
              setState(() {
                color = Colors.red.shade100;
              });
            }
          }
        },
        child: Container(
          color: color,
          height: 50,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.option,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
