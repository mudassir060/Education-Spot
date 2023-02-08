import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_spot/Widgets/myTextfield.dart';
import 'package:flutter/material.dart';

import '../../Widgets/mySpacer.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
TextEditingController titlecontroler = TextEditingController();
TextEditingController startcontroler = TextEditingController();
TextEditingController endcontroler = TextEditingController();

educationUpdate(context, UserData) async {
  var list = UserData["Education"];
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Wrap(
          children: [
            const Center(
              child: Text(
                "Add Education",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            myTextfield(
                titel: "", hint: "Degree Title", textcontroler: titlecontroler),
            myTextfield(
                titel: "", hint: "start year", textcontroler: startcontroler),
            myTextfield(
                titel: "", hint: "end year", textcontroler: endcontroler),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        list.add(
                          {
                            "name": titlecontroler.text,
                            "start": startcontroler.text,
                            "end": endcontroler.text
                          },
                        );
                        await firestore
                            .collection("users")
                            .doc(UserData["UID"])
                            .update({
                          "Education": list,
                        });
                        titlecontroler.clear();
                        startcontroler.clear();
                        endcontroler.clear();
                      },
                      child: const Text("Update")),
                  ElevatedButton(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel")),
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}
