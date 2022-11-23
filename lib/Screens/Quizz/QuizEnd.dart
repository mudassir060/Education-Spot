import 'package:flutter/material.dart';

import '../../Widgets/BottomNavigBar.dart';
import '../../Widgets/myAppBar.dart';
import '../../Widgets/mySpacer.dart';
import '../../constants/images.dart';
import '../../constants/style.dart';

class QuizEnd extends StatelessWidget {
  final int scoure;

  const QuizEnd({Key? key, required this.scoure}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BottomNavigBar()),
                    );
                  },
                  child: Image.asset(backCurve)),
              mySpacer(0.0, 0.0),
              Column(
                children: [
                  const Text(
                    "Result",
                    style:
                    TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  mySpacer(10.0, 0.0),
                  Container(
                    width: 100,
                    height: 2,
                    color: primaryColor,
                  )
                ],
              ),
              mySpacer(0.0, 0.0),
              mySpacer(0.0, 0.0),

            ],
          ),
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
