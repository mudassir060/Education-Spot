import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                  // // // // // // // // // // // Text Heading // // // // // // // //
                  Positioned(
                    top: 100,
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

              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  height: 190 * data.toDouble(),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                    child: GridView.count(
                      primary: false,
                      crossAxisCount: 3,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      children: List.generate(Community.length, (index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => communityChatScreen(name:Community[index]["name"]!)),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 17,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              // color: primaryColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Center(
                                    child: Image.asset(
                                  Community[index]["image"]!,
                                  height: 80,
                                )),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 6.0),
                                  child: Text(
                                    Community[index]["name"]!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
