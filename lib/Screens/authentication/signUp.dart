import 'package:education_spot/constants/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Widgets/myTextfield.dart';
import '../../Widgets/mySpacer.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: null,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                mySpacer(40.0, 0.0),
                const Align(
                    alignment: Alignment(-1.5, -0.40),
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: green,
                    )),
                mySpacer(0.0, 0.0),
                Align(
                    alignment: Alignment(1.5, 0.40),
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: primaryColor,
                    )),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                mySpacer(60.0, vwidth),
                const Text(
                  "Create new Account",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
                mySpacer(5.0, vwidth),
                const Text(
                  "Already Registerd? Log in here",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                mySpacer(30.0, vwidth),
                Container(
                  height: 460,
                  width: vwidth - 50,
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      myTextfield(
                        titel: 'NAME',
                        hint: 'name',
                        textcontroler: null,
                      ),
                      myTextfield(
                        titel: 'EMAIL',
                        hint: 'email',
                        textcontroler: null,
                      ),
                      myTextfield(
                        titel: 'PASSWORD',
                        hint: 'password',
                        textcontroler: null,
                      ),
                      myTextfield(
                        titel: 'MOBILE NUMBER',
                        hint: 'mobile number',
                        textcontroler: null,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
