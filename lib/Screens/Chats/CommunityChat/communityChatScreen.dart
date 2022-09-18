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
  TextEditingController replyController = TextEditingController();

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

            ],
          ),
        ),
      ),
    );
  }
}

