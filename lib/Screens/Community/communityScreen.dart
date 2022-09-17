import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Widgets/mySpacer.dart';
import '../../constants/images.dart';
import '../../constants/style.dart';

class communityScreen extends StatefulWidget {
  const communityScreen({Key? key}) : super(key: key);

  @override
  State<communityScreen> createState() => _communityScreenState();
}

class _communityScreenState extends State<communityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                        "Notification",
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
              // // // // // // // // // // // TextField // // // // // // // // //
              Positioned(
                top: 100,
                left: 60,
                child: Container(
                  width: 300,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primaryColor,
                  ),
                  padding: const EdgeInsets.only(left: 15.0),
                  child: const TextField(
                    // controller: textcontroler,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        hintText: "Enter your hint",
                        hintStyle: TextStyle(color: Colors.white),
                        border: null),
                  ),
                ),
              )
            ],
          ),
          mySpacer(10.0, 0.0),

          // // // // // // // // // // // Text Heading // // // // // // // // //
          Text(
            "Join the Community",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          mySpacer(10.0, 0.0),
          // // // // // // // // // // // Community List // // // // // // // // //

          Container(
            width: 300,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: primaryColor,
            ),
            padding: const EdgeInsets.only(left: 15.0),

          ),
        ],
      ),
    );
  }
}
