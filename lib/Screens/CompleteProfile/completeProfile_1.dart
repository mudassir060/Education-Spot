// ignore_for_file: camel_case_types

import 'package:education_spot/Screens/CompleteProfile/completeProfile_2.dart';
import 'package:flutter/material.dart';
import '../../Widgets/myTextfield.dart';
import '../../Widgets/mySpacer.dart';
import 'Widgets/staper.dart';

class completeProfile_1 extends StatefulWidget {
  final Map userData;
  const completeProfile_1({Key? key, required this.userData}) : super(key: key);

  @override
  State<completeProfile_1> createState() => _completeProfile_1State();
}

class _completeProfile_1State extends State<completeProfile_1> {
  final TextEditingController usernameCtrl = TextEditingController();
  final TextEditingController webCtrl = TextEditingController();
  final TextEditingController addressCtrl = TextEditingController();
  final TextEditingController phonenoCtrl = TextEditingController();
  final TextEditingController jobCtrl = TextEditingController();
  final TextEditingController aboutCtrl = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    usernameCtrl.text = widget.userData["username"];
    webCtrl.text = widget.userData["web"];
    addressCtrl.text = widget.userData["address"];
    phonenoCtrl.text = widget.userData["PhoneNo"];
    jobCtrl.text = widget.userData["job"];
    aboutCtrl.text = widget.userData["about_me"];
    super.initState();
  }

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
              mySpacer(20.0, vwidth),
              const Text(
                "Update Your Account",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              mySpacer(5.0, vwidth),
              const Text(
                "Complete Your Profile",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              mySpacer(10.0, vwidth),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    myTextfield(
                      titel: 'NAME',
                      hint: 'name',
                      textcontroler: usernameCtrl,
                    ),
                    mySpacer(10.0, vwidth),
                    myTextfield(
                      titel: 'Web or Portfolio',
                      hint: 'web',
                      textcontroler: webCtrl,
                    ),
                    mySpacer(10.0, vwidth),
                    myTextfield(
                      titel: 'address',
                      hint: 'address',
                      textcontroler: addressCtrl,
                    ),
                    mySpacer(10.0, vwidth),
                    myTextfield(
                      titel: 'MOBILE NUMBER',
                      hint: 'mobile number',
                      textcontroler: phonenoCtrl,
                    ),
                    mySpacer(10.0, vwidth),
                    myTextfield(
                      titel: 'Job',
                      hint: 'Job',
                      textcontroler: jobCtrl,
                    ),
                     mySpacer(10.0, vwidth),
                    MLTextfield(
                      titel: 'About Us',
                      hint: 'About Us',
                      textcontroler: aboutCtrl,
                    ),
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
                staper(1),
            IconButton(
                onPressed: () {
                  widget.userData["username"] = usernameCtrl.text;
                  widget.userData["web"] = webCtrl.text;
                  widget.userData["address"] = addressCtrl.text;
                  widget.userData["PhoneNo"] = phonenoCtrl.text;
                  widget.userData["job"] = jobCtrl.text;
                  widget.userData["about_me"] = aboutCtrl.text;
                  if (usernameCtrl.text != null &&
                      webCtrl.text != null &&
                      addressCtrl.text != null &&
                      phonenoCtrl.text != null &&
                      jobCtrl.text != null&&
                      aboutCtrl.text != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => completeProfile_2(
                                userData: widget.userData,
                              )),
                    );
                  } else {
                    print("please fill all text field");
                  }
                },
                icon: Icon(Icons.arrow_forward)),
          ],
        ),
      ),
    );
  }
}
