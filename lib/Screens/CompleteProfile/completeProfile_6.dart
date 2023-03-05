// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import '../../Widgets/myTextfield.dart';
import '../../Widgets/mySpacer.dart';
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
                              return Padding(
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
                              );
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
            IconButton(
                onPressed: () {
                  if (widget.userData["Hobbies"] != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => completeProfile_3(
                                userData: widget.userData,
                              )),
                    );
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
