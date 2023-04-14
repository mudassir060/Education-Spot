// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../Widgets/myTextfield.dart';
import '../../Widgets/mySpacer.dart';
import '../CV/CVScreen.dart';
import 'Widgets/staper.dart';
import 'completeProfile_3.dart';

class completeProfile_6 extends StatefulWidget {
  final Map userData;
  const completeProfile_6({Key? key, required this.userData}) : super(key: key);

  @override
  State<completeProfile_6> createState() => _completeProfile_6State();
}

class _completeProfile_6State extends State<completeProfile_6> {
  final TextEditingController hobbiesCtrl = TextEditingController();
  var rating = 0.0;
  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              mySpacer(30.0, vwidth),
              const Text(
                "Update Your Hobbies",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              mySpacer(30.0, vwidth),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    myTextfield(
                      titel: 'Hobbies',
                      hint: 'Hobbies',
                      textcontroler: hobbiesCtrl,
                    ),
                    Slider(
                      value: rating,
                      onChanged: (newrating) {
                        setState(() {
                          rating = newrating;
                        });
                      },
                      label: "$rating",
                      divisions: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              hobbiesCtrl.clear();
                              setState(() {
                                rating = 0;
                              });
                            },
                            child: Text("Clear")),
                        ElevatedButton(
                            onPressed: () {
                              if (widget.userData["Hobbies"] == null) {
                                widget.userData["Hobbies"] = [];
                              }
                              widget.userData["Hobbies"].add(
                                  {"name": hobbiesCtrl.text, "rating": rating});
                              print("++++${widget.userData["Hobbies"]}");
                              hobbiesCtrl.clear();
                              setState(() {
                                rating = 0;
                              });
                            },
                            child: Text("Add")),
                      ],
                    ),
                    widget.userData["Hobbies"] != null
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.userData["Hobbies"].length,
                            itemBuilder: (BuildContext context, int index) {
                              return Slidable(
                      key: const ValueKey(0),
                      endActionPane: ActionPane(
                        motion: ScrollMotion(),
                        children: [
                          SlidableAction(
                            icon: Icons.delete,
                            foregroundColor: Colors.red,
                            onPressed: (BuildContext context) async {
                              setState(() {
                                widget.userData["Hobbies"].removeAt(index);
                              });
                              await FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(widget.userData["UID"])
                                  .update({
                                "Hobbies": widget.userData["Hobbies"],
                              });
                            },
                          ),
                        ],
                      ),child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "${widget.userData["Hobbies"][index]["name"]}"),
                                    SizedBox(
                                      width: 100,
                                      child: LinearProgressIndicator(
                                        value: widget.userData["Hobbies"][index]
                                            ["rating"],
                                      ),
                                    ),
                                  ],
                                ),
                               ), );
                            },
                          )
                        : const Text("No Hobbies"),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)),
            staper(6),
            IconButton(
                onPressed: () {
                  if (widget.userData["Hobbies"] != null) {
                    SaveButton(context, widget.userData);
                  } else {
                    print("please add some Hobbies");
                  }
                },
                icon: Icon(Icons.arrow_forward)),
          ],
        ),
      ),
    );
  }
}

SaveButton(context, userData) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Save Profile"),
        content: Text("Are you sure you want to save your profile data."),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel")),
          ElevatedButton(
              onPressed: () async {
                FirebaseFirestore firestore = FirebaseFirestore.instance;
                await firestore
                    .collection("users")
                    .doc(userData['UID'])
                    .set(userData);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CVScreen(
                            UserData: userData,
                          )),
                );
              },
              child: const Text("Save")),
        ],
      );
      ;
    },
  );
}
