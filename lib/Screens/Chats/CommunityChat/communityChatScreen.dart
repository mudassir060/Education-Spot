import 'package:flutter/material.dart';

import '../../../Widgets/mySpacer.dart';
import '../../../constants/images.dart';
import '../../../constants/style.dart';

class communityChatScreen extends StatefulWidget {
  const communityChatScreen({Key? key}) : super(key: key);

  @override
  State<communityChatScreen> createState() => _communityChatScreenState();
}

class _communityChatScreenState extends State<communityChatScreen> {
  @override
  Widget build(BuildContext context) {
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
                        style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
