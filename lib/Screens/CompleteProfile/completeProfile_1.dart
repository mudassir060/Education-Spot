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
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController phonenocontroller = TextEditingController();

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
              "Create new Account",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            mySpacer(5.0, vwidth),
            const Text(
              "Already not Registered? Sign up here",
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
                    textcontroler: usernamecontroller,
                  ),
                  myTextfield(
                    titel: 'EMAIL',
                    hint: 'email',
                    textcontroler: emailcontroller,
                  ),
                  myTextfield(
                    titel: 'PASSWORD',
                    hint: 'password',
                    textcontroler: passwordcontroller,
                  ),
                  myTextfield(
                    titel: 'MOBILE NUMBER',
                    hint: 'mobile number',
                    textcontroler: phonenocontroller,
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
          ],
        ),
      ),
    );
  }
}
