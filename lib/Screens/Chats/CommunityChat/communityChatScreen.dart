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
              Container(
                height: 300,
                width: vwidth-50,
                padding: EdgeInsets.all(20.0),
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
                          style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Azeem        ",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    mySpacer(5.0, 0.0),
                    Container(
                      height: 2,
                        width: vwidth-100,
                      color: Colors.grey,
                    ),
                    mySpacer(15.0, 0.0),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
