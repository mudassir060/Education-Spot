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
  var startDate;
  var endDate;
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
                      titel: 'Title',
                      hint: 'Experience',
                      textcontroler: experienceCtrl,
                    ),
                    mySpacer(10.0, vwidth),
                    myTextfield(
                      titel: 'Description',
                      hint: 'Description',
                      textcontroler: desCtrl,
                    ),
                    mySpacer(10.0, vwidth),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              showDatePicker(
                                  context: context,
                                  firstDate:
                                      DateTime(DateTime.now().year - 50, 1),
                                  lastDate: DateTime.now(),
                                  initialDate: DateTime.now(),
                                  builder: (context, picker) {
                                    return Container(
                                      child: picker!,
                                    );
                                  }).then((selectedDate) {
                                //TODO: handle selected date
                                if (selectedDate != null) {
                                  setState(() {
                                    startDate =
                                        "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
                                  });
                                }
                              });
                            },
                            child: Text("Start Date ${startDate ?? ""}")),
                        ElevatedButton(
                            onPressed: () {
                              showDatePicker(
                                  context: context,
                                  firstDate:
                                      DateTime(DateTime.now().year - 50, 1),
                                  lastDate: DateTime.now(),
                                  initialDate: DateTime.now(),
                                  builder: (context, picker) {
                                    return Container(
                                      child: picker!,
                                    );
                                  }).then((selectedDate) {
                                //TODO: handle selected date
                                if (selectedDate != null) {
                                  setState(() {
                                    endDate =
                                        "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
                                  });
                                }
                              });
                            },
                            child: Text("End Date ${endDate ?? ""}")),
                      ],
                    ),
                    mySpacer(20.0, vwidth),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              experienceCtrl.clear();
                              desCtrl.clear();
                              setState(() {
                                startDate = null;
                                endDate = null;
                              });
                            },
                            child: Text("Clear")),
                        ElevatedButton(
                            onPressed: () {
                              if (widget.userData["experiences"] == null) {
                                widget.userData["experiences"] = [];
                              }
                              widget.userData["experiences"].add({
                                "name": experienceCtrl.text,
                                "des": desCtrl.text,
                                "startDate": startDate,
                                "endDate": endDate,
                              });
                              setState(() {
                                startDate = null;
                                endDate = null;
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
                              return Container(
                                padding: const EdgeInsets.all(8.0),
                                margin: const EdgeInsets.all(8.0),
                                color: index % 2 == 0 ? Color.fromARGB(255, 235, 232, 232) : Color.fromARGB(255, 180, 178, 178),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            "${widget.userData["experiences"][index]["name"]}"),
                                        Text(
                                            "${widget.userData["experiences"][index]["startDate"]}"),
                                        Text("To"),
                                        Text(
                                            "${widget.userData["experiences"][index]["endDate"]}"),
                                      ],
                                    ),
                                    Text(
                                        "${widget.userData["experiences"][index]["des"]}"),
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
