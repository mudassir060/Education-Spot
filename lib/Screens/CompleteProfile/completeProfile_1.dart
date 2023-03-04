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
  @override
  void initState() {
    // TODO: implement initState
    usernameCtrl.text = widget.userData["username"];
    webCtrl.text = widget.userData["web"];
    addressCtrl.text = widget.userData["address"];
    phonenoCtrl.text = widget.userData["PhoneNo"];
    jobCtrl.text = widget.userData["job"];
    super.initState();
  }

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
              "Update Your Account",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            mySpacer(5.0, vwidth),
            const Text(
              "Complete Your Profile",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            mySpacer(30.0, vwidth),
            Container(
              height: 520,
              width: vwidth - 50,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  myTextfield(
                    titel: 'NAME',
                    hint: 'name',
                    textcontroler: usernameCtrl,
                  ),
                  myTextfield(
                    titel: 'Web or Portfolio',
                    hint: 'web',
                    textcontroler: webCtrl,
                  ),
                  myTextfield(
                    titel: 'address',
                    hint: 'address',
                    textcontroler: addressCtrl,
                  ),
                  myTextfield(
                    titel: 'MOBILE NUMBER',
                    hint: 'mobile number',
                    textcontroler: phonenoCtrl,
                  ),
                  myTextfield(
                    titel: 'Job',
                    hint: 'Job',
                    textcontroler: jobCtrl,
                  ),
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
            IconButton(onPressed: () {
               widget.userData["username"] = usernameCtrl.text;
                  widget.userData["web"] = webCtrl.text;
                  widget.userData["address"] = addressCtrl.text;
                  widget.userData["PhoneNo"] = phonenoCtrl.text;
                  widget.userData["job"] = jobCtrl.text;
                  print("======>${widget.userData}");
            }, icon: Icon(Icons.arrow_forward)),
          ],
        ),
      ),
    );
  }
}
