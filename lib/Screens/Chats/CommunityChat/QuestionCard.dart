import 'package:flutter/material.dart';

import '../../../Widgets/mySpacer.dart';
import '../ChatReply.dart';
import 'Replys.dart';

TextEditingController replyController = TextEditingController();

Widget QuestionCard(
    vwidth, sendername, question, List<Map<String, String>> list) {
  return Container(
    width: vwidth - 50,
    padding: EdgeInsets.all(20.0),
    margin: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "       QUESTION",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "$sendername        ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        mySpacer(5.0, 0.0),
        Container(
          height: 2,
          width: vwidth - 100,
          color: Colors.grey,
        ),
        mySpacer(15.0, 0.0),
        Text(
          "$question",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        mySpacer(10.0, 0.0),
        Container(
          height: 55 * list.length.toDouble(),
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return Replys(list[index]["name"], list[index]["reply"]);
              }),
        ),
        mySpacer(10.0, 0.0),
        ChatReply(replyController, "Type something ...", () {}),
        mySpacer(10.0, 0.0),
      ],
    ),
  );
}
