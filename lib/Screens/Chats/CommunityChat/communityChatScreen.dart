import 'package:education_spot/Screens/Chats/CommunityChat/QuestionCard.dart';
import 'package:flutter/material.dart';

import '../../../Widgets/mySpacer.dart';
import '../../../constants/images.dart';
import '../../../constants/style.dart';
import '../../Community/SmsBox.dart';
import '../ChatReply.dart';
import 'Replys.dart';

class communityChatScreen extends StatefulWidget {
  final Map UserData;
  final String name;

  const communityChatScreen({Key? key, required this.name, required this.UserData}) : super(key: key);

  @override
  State<communityChatScreen> createState() => _communityChatScreenState();
}

class _communityChatScreenState extends State<communityChatScreen> {
  var chatdata = [
    {"name": "Mudassir", "reply": "I don't discuss on any topic with you"},
    {"name": "Haseeb", "reply": "I want to discuss your secret to beauty"},
  ];
  TextEditingController replycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          foregroundColor: seconderyColor,
          mini: true,
          onPressed: () {
            smsBox(context, );
          },
          child: Icon(Icons.add),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // // // // // // // // // // // Top Bar // // // // // // // // //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(backCurve)),
                  mySpacer(0.0, 0.0),
                  Column(
                    children: [
                      Text(
                        widget.name,
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
                  vwidth,
                  "Azeem",
                  "What topics do you want to discuss?",
                  chatdata,
                  replycontroller, () {
                setState(() {
                  chatdata.add({
                    "name": "Mudassir",
                    "reply": replycontroller.text,
                  });
                });
              }),
            ],
          ),
        ),
      ),
    );
  }
}
