import 'package:flutter/material.dart';

import '../Screens/Chats/CommunityChat/communityChatScreen.dart';

class ImageButtonGrid extends StatelessWidget {
  final Map UserData;
  final List<Map> Community;

  const ImageButtonGrid(
      {Key? key, required this.Community, required this.UserData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: GridView.count(
          shrinkWrap: true,
          primary: false,
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          children: List.generate(Community.length, (index) {
            return InkWell(
              onTap: () {
                if (Community[index]["page"] == null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => communityChatScreen(
                        name: "${Community[index]["name"]!}",
                        UserData: UserData,
                      ),
                    ),
                  );
                }
                if (Community[index]["page"] == true) {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('AlertDialog Title'),
                      content: const Text('AlertDialog description'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Community[index]["page"],
                    ),
                  );
                }
              },
              child: Card(
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   borderRadius: BorderRadius.circular(30),
                //   boxShadow: [
                //     BoxShadow(
                //       color: Colors.grey.withOpacity(0.1),
                //       spreadRadius: 5,
                //       blurRadius: 7,
                //       offset: Offset(0, 3), // changes position of shadow
                //     ),
                //   ],
                //   // color: primaryColor,
                // ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                        top: 8.0,
                        bottom: 8.0,
                      ),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(Community[index]["image"]!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        Community[index]["name"]!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
