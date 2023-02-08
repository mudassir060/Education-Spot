import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_spot/Widgets/myTextfield.dart';
import 'package:flutter/material.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
TextEditingController textcontroler = TextEditingController();

skillUpdate(context, UserData) async {
  var list = UserData["Skills"];

  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          children: [
            const Center(
              child: Text(
                "Add Skill",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: myTextfield(
                  titel: "",
                  hint: "Enter Your Skill",
                  textcontroler: textcontroler),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      list.add(textcontroler.text);
                      await firestore
                          .collection("users")
                          .doc(UserData["UID"])
                          .update({
                        "Skills": list,
                      });
                      textcontroler.clear();
                    },
                    child: const Text("Update")),
                ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel")),
              ],
            ),
          ],
        ),
      );
    },
  );
}
