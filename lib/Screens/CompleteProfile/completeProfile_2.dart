// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_spot/Widgets/BottomNavigBar.dart';
import 'package:education_spot/Widgets/myButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../Widgets/myTextfield.dart';
import '../../Widgets/mySpacer.dart';
import 'completeProfile_3.dart';

class completeProfile_2 extends StatefulWidget {
  final Map userData;
  const completeProfile_2({Key? key, required this.userData}) : super(key: key);

  @override
  State<completeProfile_2> createState() => _completeProfile_2State();
}

class _completeProfile_2State extends State<completeProfile_2> {
  final TextEditingController skillCtrl = TextEditingController();
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
                "Update Your Skills",
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
                      titel: 'Skill',
                      hint: 'Skill',
                      textcontroler: skillCtrl,
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
                              skillCtrl.clear();
                              setState(() {
                                rating = 0;
                              });
                            },
                            child: Text("Clear")),
                        ElevatedButton(
                            onPressed: () {
                              widget.userData["Skills"].add(
                                  {"name": skillCtrl.text, "rating": rating});
                              print("++++${widget.userData["Skills"]}");
                              skillCtrl.clear();
                              setState(() {
                                rating = 0;
                              });
                            },
                            child: Text("Add Skill")),
                      ],
                    ),
                    widget.userData["Skills"] != null
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.userData["Skills"].length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "${widget.userData["Skills"][index]["name"]}"),
                                    SizedBox(
                                      width: 100,
                                      child: LinearProgressIndicator(
                                        value: widget.userData["Skills"][index]
                                            ["rating"],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        : Text("No Skill"),
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
            IconButton(
                onPressed: () {
                  if (widget.userData["Skills"] != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => completeProfile_3(
                                userData: widget.userData,
                              )),
                    );
                  } else {
                    print("please add some skill");
                  }
                },
                icon: Icon(Icons.arrow_forward)),
          ],
        ),
      ),
    );
  }
}
