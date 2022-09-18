import 'package:education_spot/Screens/Chats/CommunityChat/QuestionCard.dart';
import 'package:flutter/material.dart';

import '../../../Widgets/mySpacer.dart';
import '../../../constants/images.dart';
import '../../../constants/style.dart';
import '../ChatReply.dart';
import 'Replys.dart';

class communityChatScreen extends StatefulWidget {
  const communityChatScreen({Key? key}) : super(key: key);

  @override
  State<communityChatScreen> createState() => _communityChatScreenState();
}

class _communityChatScreenState extends State<communityChatScreen> {
  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // // // // // // // // // // // Top Bar // // // // // // // // //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(communitCurve),
                  mySpacer(0.0, 0.0),
                  Column(
                    children: [
                      const Text(
                        "Community Name",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      mySpacer(10.0, 0.0),
                      Container(
                        width: 200,
                        height: 2,
                        color: primaryColor,
                      )
                    ],
                  ),
                  mySpacer(0.0, 0.0),
                ],
              ),
              // // // // // // // // // // // Chats // // // // // // // // //
              QuestionCard(
                  vwidth, "Azeem", "What topics do you want to discuss?", [
                {
                  "name": "Mudassir",
                  "reply": "I don't discuss on any topic with you"
                },
                {
                  "name": "Haseeb",
                  "reply": "I want to discuss your secret to beauty"
                },
              ]),
              QuestionCard(
                  vwidth, "Azeem", "What topics do you want to discuss?", [
                {
                  "name": "Mudassir",
                  "reply": "I don't discuss on any topic with you"
                },
                {
                  "name": "Haseeb",
                  "reply": "I want to discuss your secret to beauty"
                },
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
