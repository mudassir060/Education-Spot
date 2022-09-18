import 'package:education_spot/Widgets/myButton.dart';
import 'package:education_spot/constants/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Widgets/myTextfield.dart';
import '../../Widgets/mySpacer.dart';
import 'widget/backDesgin.dart';

class sigupScreen extends StatefulWidget {
  const sigupScreen({Key? key}) : super(key: key);

  @override
  State<sigupScreen> createState() => _sigupScreenState();
}

class _sigupScreenState extends State<sigupScreen> {
  TextEditingController namecontroller = TextEditingController();

  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  TextEditingController phnocontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            backDesgin(),
            Column(
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
                  height: 500,
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
                        textcontroler: namecontroller,
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
                        textcontroler: phnocontroller,
                      ),
                      myButton(
                          width: vwidth,
                          function: () {},
                          name: "Sign Up",
                          loading: false)
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
