import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_spot/Widgets/myTextfield.dart';
import 'package:flutter/material.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
TextEditingController titlecontroler = TextEditingController(text: "abc@gmail.com");
TextEditingController startcontroler = TextEditingController(text: "abc@gmail.com");
TextEditingController endcontroler = TextEditingController(text: "abc@gmail.com");

educationUpdate(context, UserData) async {
  var list = UserData["Education"];
  // {"name": "Matric", "start": "2016", "end": "2019"},

  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          children: [
            const Text("Add Education"),
            myTextfield(titel: "Education Title", hint: "hint", textcontroler: titlecontroler),
            myTextfield(titel: "start", hint: "hint", textcontroler: startcontroler),
            myTextfield(titel: "end", hint: "hint", textcontroler: endcontroler),
            ElevatedButton(
                onPressed: () async {
                  list.add(
                    {"name": titlecontroler.text, "start": startcontroler.text, "end": endcontroler.text},
                  );
                  await firestore.collection("users").doc(UserData["UID"]).update({
                    "Education": list,
                  });
                  titlecontroler.clear();
                  startcontroler.clear();
                  endcontroler.clear();
                },
                child: const Text("Update")),
            ElevatedButton(
                onPressed: () async {

                },
                child: const Text("Cancel")),



          ],
        ),
      );
    },
  );
}
