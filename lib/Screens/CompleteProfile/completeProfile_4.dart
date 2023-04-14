// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import '../../Widgets/myTextfield.dart';
import '../../Widgets/mySpacer.dart';
import '../../constants/style.dart';
import 'Widgets/staper.dart';
import 'completeProfile_5.dart';

class completeProfile_4 extends StatefulWidget {
  final Map userData;
  const completeProfile_4({Key? key, required this.userData}) : super(key: key);

  @override
  State<completeProfile_4> createState() => _completeProfile_4State();
}

class _completeProfile_4State extends State<completeProfile_4> {
  final TextEditingController degreeCtrl = TextEditingController();
  final TextEditingController uniCtrl = TextEditingController();
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
                "Update Your Education",
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
                      titel: 'Degree Title',
                      hint: 'Degree Title',
                      textcontroler: degreeCtrl,
                    ),
                    mySpacer(10.0, vwidth),
                    myTextfield(
                      titel: 'Nniversity or Collage Name',
                      hint: 'Nniversity or Collage Name',
                      textcontroler: uniCtrl,
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
                              degreeCtrl.clear();
                              uniCtrl.clear();
                              setState(() {
                                startDate = null;
                                endDate = null;
                              });
                            },
                            child: Text("Clear")),
                        ElevatedButton(
                            onPressed: () {
                              if (widget.userData["Education"] == null) {
                                widget.userData["Education"] = [];
                              }
                              widget.userData["Education"].add({
                                "name": degreeCtrl.text,
                                "uni": uniCtrl.text,
                                "startDate": startDate,
                                "endDate": endDate,
                              });
                              setState(() {
                                startDate = null;
                                endDate = null;
                              });
                              print("++++${widget.userData["Education"]}");
                              degreeCtrl.clear();
                              uniCtrl.clear();
                            },
                            child: Text("Add")),
                      ],
                    ),
                    widget.userData["Education"] != null
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.userData["Education"].length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                padding: const EdgeInsets.all(8.0),
                                margin: const EdgeInsets.all(8.0),
                                color: index % 2 == 0
                                    ? Color.fromARGB(255, 235, 232, 232)
                                    : Color.fromARGB(255, 180, 178, 178),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            "${widget.userData["Education"][index]["name"]}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold, color: primaryColor),),
                                        Text(
                                            "(${widget.userData["Education"][index]["startDate"]})"),
                                        Text("To",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold, color: primaryColor),),
                                        Text(
                                            "(${widget.userData["Education"][index]["endDate"]})"),
                                      ],
                                    ),
                                    Text(
                                        "${widget.userData["Education"][index]["uni"]}"),
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
            staper(4),
            IconButton(
                onPressed: () {
                  if (widget.userData["Education"] != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => completeProfile_5(
                                userData: widget.userData,
                              )),
                    );
                  } else {
                    print("please add some Education");
                  }
                },
                icon: Icon(Icons.arrow_forward)),
          ],
        ),
      ),
    );
  }
}
