import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Widgets/ImageButtonGrid.dart';
import '../../Widgets/mySpacer.dart';
import '../../constants/images.dart';
import '../../constants/style.dart';
import '../Chats/CommunityChat/communityChatScreen.dart';

class communityScreen extends StatefulWidget {
  const communityScreen({Key? key}) : super(key: key);

  @override
  State<communityScreen> createState() => _communityScreenState();
}

class _communityScreenState extends State<communityScreen> {
  var Community = [
    {"name": "Common Room", "image": CommonRoom},
    {"name": "Discussion", "image": Discussion},
    {"name": "Scholarships", "image": Scholarships2},
    {"name": "Jobs", "image": Jobs},
    {"name": "Admissions", "image": Admissions},
    {"name": "Others", "image": Others},
  ];

  @override
  Widget build(BuildContext context) {
    var data = Community.length;
    var quot = (data / 2).floor();
    var rem = data.remainder(2);
    if (rem >= 1) {
      data = quot + 1;
    } else {
      data = quot;
    }
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // // // // // // // // // // // Top Bar // // // // // // // // //
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(communitCurve),
                      mySpacer(0.0, 0.0),
                      Column(
                        children: [
                          const Text(
                            "Community",
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
                  // // // // // // // // // // // Text Heading // // // // // // // //
                  const Positioned(
                    top: 110,
                    left: 60,
                    child: Text(
                      "Join the Community",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              // // // // // // // // // // // Community List // // // // // // // // //

              ImageButtonGrid(vheight: data.toDouble(), Community: Community,)
            ],
          ),
        ),
      ),
    );
  }
}
