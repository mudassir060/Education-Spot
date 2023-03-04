// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import '../../Widgets/myTextfield.dart';
import '../../Widgets/mySpacer.dart';

class completeProfile_3 extends StatefulWidget {
  final Map userData;
  const completeProfile_3({Key? key, required this.userData}) : super(key: key);

  @override
  State<completeProfile_3> createState() => _completeProfile_3State();
}

class _completeProfile_3State extends State<completeProfile_3> {
  final TextEditingController experienceCtrl = TextEditingController();
  final TextEditingController desCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            mySpacer(30.0, vwidth),
            const Text(
              "Update Your Experience",
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
                    titel: 'Experience',
                    hint: 'Experience',
                    textcontroler: experienceCtrl,
                  ),
                  mySpacer(10.0, vwidth),
                  myTextfield(
                    titel: 'Description',
                    hint: 'Description',
                    textcontroler: desCtrl,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            experienceCtrl.clear();
                            desCtrl.clear();
                          },
                          child: Text("Clear")),
                      ElevatedButton(
                          onPressed: () {
                            widget.userData["experiences"].add({
                              "name": experienceCtrl.text,
                              "des": desCtrl.text,
                            });
                            print("++++${widget.userData["experiences"]}");
                            experienceCtrl.clear();
                            desCtrl.clear();
                          },
                          child: Text("Add experience")),
                    ],
                  ),
                  widget.userData["experiences"] != null
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.userData["experiences"].length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "${widget.userData["experiences"][index]["name"]}"),
                                  SizedBox(
                                    width: 100,
                                    child: LinearProgressIndicator(
                                      value: widget.userData["experiences"]
                                          [index]["rating"],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      : Container(),
                ],
              ),
            ),
          ],
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
                  if (widget.userData["experiences"] != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => completeProfile_3(
                                userData: widget.userData,
                              )),
                    );
                  } else {
                    print("please add some experience");
                  }
                },
                icon: Icon(Icons.arrow_forward)),
          ],
        ),
      ),
    );
  }
}
