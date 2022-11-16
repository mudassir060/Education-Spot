import 'package:education_spot/Widgets/myAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Data.dart';

class QuizQuestion extends StatefulWidget {
  const QuizQuestion({Key? key}) : super(key: key);

  @override
  State<QuizQuestion> createState() => _QuizQuestionState();
}

class _QuizQuestionState extends State<QuizQuestion> {
  var color = Colors.white;
  var val = "434";
  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
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
                Card(
                  child: SizedBox(
                    height: 80,
                    width: vwidth,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${MCAT[0]["question"]}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                OptionCard(option: "A: ${MCAT[0]["A"]}", index: 1,),
                OptionCard(option: "B: ${MCAT[0]["B"]}", index: 2,),
                OptionCard(option: "C: ${MCAT[0]["C"]}", index: 3,),
                OptionCard(option: "D: ${MCAT[0]["D"]}", index: 4,),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {},
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
  final String option;
  final int index;
  const OptionCard({Key? key, required this.option, required this.index}) : super(key: key);

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
          if (MCAT[0]["correctIndex"] == widget.index) {
            setState(() {
              color = Colors.greenAccent.shade100;
            });
          }else{
            setState(() {
              color = Colors.red.shade100;
            });
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
                  widget. option,
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
