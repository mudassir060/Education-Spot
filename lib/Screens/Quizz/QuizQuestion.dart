import 'package:education_spot/Widgets/myAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class QuizQuestion extends StatefulWidget {
  final Map data;
  const QuizQuestion({Key? key, required this.data}) : super(key: key);

  @override
  State<QuizQuestion> createState() => _QuizQuestionState();
}

class _QuizQuestionState extends State<QuizQuestion> {
  TextEditingController d_controlle = TextEditingController(text: "0");

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
                        "${widget.data["question"]}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                OptionCard(option: "A: ${widget.data["A"]}", index: 1, d_controlle: d_controlle, C_index: widget.data["correctIndex"],),
                OptionCard(option: "B: ${widget.data["B"]}", index: 2, d_controlle: d_controlle, C_index: widget.data["correctIndex"],),
                OptionCard(option: "C: ${widget.data["C"]}", index: 3, d_controlle: d_controlle, C_index: widget.data["correctIndex"],),
                OptionCard(option: "D: ${widget.data["D"]}", index: 4, d_controlle: d_controlle, C_index: widget.data["correctIndex"],),
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
  final TextEditingController d_controlle;
  final String option;
  final int index;
  final int C_index;

  const OptionCard({Key? key, required this.option, required this.index, required this.d_controlle, required this.C_index}) : super(key: key);

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
