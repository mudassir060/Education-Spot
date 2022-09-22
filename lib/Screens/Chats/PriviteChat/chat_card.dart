import 'package:education_spot/Widgets/mySpacer.dart';
import 'package:education_spot/constants/style.dart';
import 'package:flutter/material.dart';

import 'chat_screen.dart';

class chat_card extends StatefulWidget {
  final Map chat_data;
  const chat_card({Key? key, required this.chat_data}) : super(key: key);

  @override
  State<chat_card> createState() => _chat_cardState();
}

class _chat_cardState extends State<chat_card> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
            },
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                      radius: 25,
                      backgroundColor: active,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Image.asset(widget.chat_data["Image"],
                            fit: BoxFit.contain),
                      )),
                  Container(
                    width: width - 150,
                    height: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.chat_data["Name"]}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${widget.chat_data["SMS"]}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // height: 80,
                    width: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: primaryColor,
                          child: Text("${widget.chat_data["No"]}",
                              style:
                                  const TextStyle(fontSize: 10, color: active)),
                        ),
                        mySpacer(10.0,0.0),
                        Text("${widget.chat_data["time"]}",
                            style: const TextStyle(fontSize: 8)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: width - 50,
            height: 1,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
