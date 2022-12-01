import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_spot/Widgets/myTextfield.dart';
import 'package:flutter/material.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
TextEditingController textcontroler = TextEditingController(text: "abc@gmail.com");

skillUpdate(context, UserData) async {
  var list = UserData["Skills"];

  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          children: [
            const Text("Add Skill"),
            myTextfield(titel: "Add Skill", hint: "hint", textcontroler: textcontroler),
            ElevatedButton(
                onPressed: () async {
                  list.add(textcontroler.text);
                  await firestore.collection("users").doc(UserData["UID"]).update({
                    "Skills": list,
                  });
                  textcontroler.clear();
                },
                child: const Text("Update")),
            ElevatedButton(
                onPressed: () async {

                },
                child: const Text("Cancel")), ElevatedButton(
                onPressed: () async {

                },
                child: const Text("Cancel")),
          ],
        ),
      );
    },
  );
}
