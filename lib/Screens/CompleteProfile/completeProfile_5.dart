// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../Widgets/myTextfield.dart';
import '../../Widgets/mySpacer.dart';
import 'Widgets/staper.dart';
import 'completeProfile_3.dart';
import 'completeProfile_6.dart';

class completeProfile_5 extends StatefulWidget {
  final Map userData;
  const completeProfile_5({Key? key, required this.userData}) : super(key: key);

  @override
  State<completeProfile_5> createState() => _completeProfile_5State();
}

class _completeProfile_5State extends State<completeProfile_5> {
  final TextEditingController languageCtrl = TextEditingController();
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
                "Update Your Language",
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
                      titel: 'Language',
                      hint: 'Language',
                      textcontroler: languageCtrl,
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
                              languageCtrl.clear();
                              setState(() {
                                rating = 0;
                              });
                            },
                            child: Text("Clear")),
                        ElevatedButton(
                            onPressed: () {
                              if (widget.userData["Language"] == null) {
                                widget.userData["Language"] = [];
                              }
                              widget.userData["Language"].add({
                                "name": languageCtrl.text,
                                "rating": rating
                              });
                              print("++++${widget.userData["Language"]}");
                              languageCtrl.clear();
                              setState(() {
                                rating = 0;
                              });
                            },
                            child: Text("Add")),
                      ],
                    ),
                    widget.userData["Language"] != null
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.userData["Language"].length,
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
                                          widget.userData["Language"]
                                              .removeAt(index);
                                        });
                                        await FirebaseFirestore.instance
                                            .collection("users")
                                            .doc(widget.userData["UID"])
                                            .update({
                                          "Language":
                                              widget.userData["Language"],
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "${widget.userData["Language"][index]["name"]}"),
                                      SizedBox(
                                        width: 100,
                                        child: LinearProgressIndicator(
                                          value: widget.userData["Language"]
                                              [index]["rating"],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        : const Text("No Language"),
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
            staper(5),
            IconButton(
                onPressed: () {
                  if (widget.userData["Language"] != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => completeProfile_6(
                                userData: widget.userData,
                              )),
                    );
                  } else {
                    print("please add some Language");
                  }
                },
                icon: Icon(Icons.arrow_forward)),
          ],
        ),
      ),
    );
  }
}
