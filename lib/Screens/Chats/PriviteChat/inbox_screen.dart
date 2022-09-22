import 'package:education_spot/constants/images.dart';
import 'package:education_spot/constants/style.dart';
import 'package:flutter/material.dart';
import 'chat_card.dart';

class inbox_screen extends StatefulWidget {
  const inbox_screen({Key? key}) : super(key: key);

  @override
  State<inbox_screen> createState() => _inbox_screenState();
}

class _inbox_screenState extends State<inbox_screen> {
  @override
  Widget build(BuildContext context) {
    var height =  MediaQuery.of(context).size.height;
    return  Scaffold(appBar: AppBar(
      title: Text('Inbox'),
      elevation: 0,
      backgroundColor: primaryColor,
      centerTitle: true,
    ),
    body: chat_card(chat_data: {"Image" : Profile, "Name": "Mian Khan", "SMS" :"Hello, is this available now?", "No":"12", "time":"04:23 PM"})
    );
  }
}
