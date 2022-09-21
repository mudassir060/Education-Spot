import 'package:flutter/material.dart';

import '../Screens/Chats/CommunityChat/communityChatScreen.dart';

class ImageButtonGrid extends StatelessWidget {
  final double vheight;
  final List<Map<String, String>> Community;
  const ImageButtonGrid({Key? key, required this.vheight, required this.Community}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        height: 190 * vheight,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: GridView.count(
            primary: false,
            crossAxisCount: 2,
            crossAxisSpacing: 25.0,
            mainAxisSpacing: 25.0,
            children: List.generate(Community.length, (index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => communityChatScreen(name:"${Community[index]["name"]!}")),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(
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
                            height: 100,
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
    );
  }
}
