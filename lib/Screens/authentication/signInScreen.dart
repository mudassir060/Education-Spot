import 'package:education_spot/Screens/authentication/sigupScreen.dart';
import 'package:education_spot/Widgets/myButton.dart';
import 'package:education_spot/constants/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Widgets/BottomNavigBar.dart';
import '../../Widgets/myTextfield.dart';
import '../../Widgets/mySpacer.dart';
import 'widget/backDesgin.dart';

class signInScreen extends StatefulWidget {
  const signInScreen({Key? key}) : super(key: key);

  @override
  State<signInScreen> createState() => _signInScreenState();
}

class _signInScreenState extends State<signInScreen> {
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

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
                  "Login",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
                mySpacer(5.0, vwidth),
                const Text(
                  "Already Registered? Sign in here",
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
                        titel: 'EMAIL',
                        hint: 'email',
                        textcontroler: emailcontroller,
                      ),
                      Column(
                        children: [
                          myTextfield(
                            titel: 'PASSWORD',
                            hint: 'password',
                            textcontroler: passwordcontroller,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Forgot Password?",
                                    style: TextStyle(color: primaryColor),
                                  )),
                            ],
                          ),
                        ],
                      ),
                      myButton(
                          width: vwidth,
                          function: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomNavigBar()),
                            );
                          },
                          name: "Sign In",
                          loading: false),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 1,
                            width: 110,
                            color: primaryColor,
                          ),
                          const Text(
                            "OR",
                            style: TextStyle(color: primaryColor),
                          ),
                          Container(
                            height: 1,
                            width: 110,
                            color: primaryColor,
                          ),
                        ],
                      ),
                      myButton(
                          width: vwidth,
                          function: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => sigupScreen()),
                            );
                          },
                          name: "Sign Up",
                          loading: false),
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
