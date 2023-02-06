import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../Widgets/myTextfield.dart';
import 'package:intl/intl.dart';

smsBox(context, UserData, cType) {
  TextEditingController QCTRL = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  DateTime now = DateTime.now();
  sentQuestion() async {
    if (QCTRL.text != null) {
      String formattedDate = DateFormat('EEE d MMM').format(now);
      await firestore.collection("Community").doc(UserData["UID"]).set({
        "UID": UserData["UID"],
        "username": UserData["username"],
        "community": cType,
        "question": QCTRL.text,
        "answers": [],
        "JoinDate": formattedDate,
      });
    } else {}
  }

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Write Question'),
        content: SizedBox(
          height: 80,
          child: myTextfield(
            titel: '',
            hint: 'Question',
            textcontroler: QCTRL,
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              sentQuestion();
            },
            child: const Text("Sent Question"),
          ),
        ],
      );
    },
  );
}
