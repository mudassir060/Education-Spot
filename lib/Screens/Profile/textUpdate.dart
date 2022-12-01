import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_spot/Widgets/myTextfield.dart';
import 'package:flutter/material.dart';


  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController textcontroler = TextEditingController(text: "abc@gmail.com");


textUpdate(context, UserData) async {


  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Wrap(
        children: [
         const Text("data"),
          myTextfield(titel: "title", hint: "hint", textcontroler: textcontroler),
          ElevatedButton(onPressed: () async {
            await firestore.collection("users").doc(UserData["UID"]).update({
              "Last Login": "formattedDate",
            });
          }, child: const Text("Update"))
        ],
      );
    },
  );
}