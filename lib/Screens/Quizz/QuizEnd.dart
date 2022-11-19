import 'package:flutter/material.dart';

import '../../Widgets/myAppBar.dart';

class QuizEnd extends StatelessWidget {
  final int scoure;

  const QuizEnd({Key? key, required this.scoure}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          const myAppBar(titel: "Result", linewidth: 100),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(
                  "${(scoure/10)*100}%",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 56, color: Colors.green),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "CORRECT: ${scoure}",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey),
                    ),
                    Text(
                      "MISTAKES: ${10-scoure}",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
