import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../Widgets/myTextfield.dart';
import 'package:intl/intl.dart';

smsBox(context,UserData, cType) {
  TextEditingController QCTRL = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  DateTime now = DateTime.now();
sentQuection() async {
  String formattedDate = DateFormat('EEE d MMM').format(now);
  await firestore.collection("users").doc(UserData["UID"]).set({
    "UID": UserData["UID"],
    "username": UserData["username"],
    "community": cType,
    "Question": QCTRL.text,
    "JoinDate": formattedDate,
  });
}
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: 200,
        child: AlertDialog(
          title: const Text('Write Question'),
          content: myTextfield(
            titel: 'Write Question',
            hint: 'email',
            textcontroler: QCTRL,
          ),
          actions: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("Sent Question"),
            ),
          ],
        ),
      );
    },
  );
}
