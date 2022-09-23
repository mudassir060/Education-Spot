import 'package:education_spot/Screens/Chats/PriviteChat/sms_card.dart';
import 'package:education_spot/constants/images.dart';
import 'package:education_spot/constants/style.dart';
import 'package:flutter/material.dart';

import '../../../Widgets/mySpacer.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController textcontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue,
                child: Image.asset(Profile, fit: BoxFit.contain),),
              mySpacer(0.0,10.0),
              Text('Inbox'),
            ],
          ),
          elevation: 0,
          backgroundColor: primaryColor,
          centerTitle: true,
        ),
        body: Container(
          // color: Colors.grey[300],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  sms_card(
                      username: "username",
                      sendername: "sendername",
                      sms: "Kay hall ha g",
                      profile: Profile,
                      time: "10:45 PM"),
                  sms_card(
                      username: "username",
                      sendername: "username",
                      sms: "Allah ka karm",
                      profile: Profile,
                      time: "10:45 PM"),
                  sms_card(
                      username: "username",
                      sendername: "sendername",
                      sms: "kay ho raha ha",
                      profile: Profile,
                      time: "10:45 PM"),
                  sms_card(
                      username: "username",
                      sendername: "username",
                      sms: "kush be ni",
                      profile: Profile,
                      time: "10:45 PM"),
                ],
              ),
              Container(
                width: vwidth,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: vwidth - 70,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        padding: const EdgeInsets.only(left: 15.0),
                        child: TextField(
                          controller: textcontroler,
                          style: const TextStyle(color: Colors.grey),
                          decoration: const InputDecoration(
                              hintText: "Write message...",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                              border: InputBorder.none),
                        ),
                      ),
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: active,
                        child: IconButton(
                            onPressed: () {}, icon: Icon(Icons.send)),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
