import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_spot/Widgets/BottomNavigBar.dart';
import 'package:education_spot/Widgets/myButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../Widgets/myTextfield.dart';
import '../../Widgets/mySpacer.dart';
import 'widget/backDesgin.dart';

class sigupScreen extends StatefulWidget {
  const sigupScreen({Key? key}) : super(key: key);

  @override
  State<sigupScreen> createState() => _sigupScreenState();
}

class _sigupScreenState extends State<sigupScreen> {
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController phonenocontroller = TextEditingController();

  bool isCheck = false;
  bool NoData = false;
  bool looding = false;

  void register() async {
    setState(() {
      looding = true;
    });
    final String name = usernamecontroller.text;
    final String email = emailcontroller.text.trim();
    final String phoneNo = phonenocontroller.text;
    final String password = passwordcontroller.text;

    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      if (name != '' && email != '' && phoneNo != '' && password != '') {
        DateTime now = DateTime.now();
        String formattedDate = DateFormat('EEE d MMM').format(now);
        final UserCredential user = await auth.createUserWithEmailAndPassword(email: email, password: password);
        await firestore.collection("users").doc(user.user!.uid).set({
          "UID": user.user!.uid,
          "username": name,
          "email": email,
          "PhoneNo": phoneNo,
          "password": password,
          "JoinDate": formattedDate,
        });

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BottomNavigBar(
                    UserData: {
                      "UID": user.user!.uid,
                      "username": name,
                      "email": email,
                      "PhoneNo": phoneNo,
                      "password": password,
                      "JoinDate": formattedDate,
                    },
                  )),
        );
      } else {
        // snackbar( "Please fill all text field");
        setState(() {
          NoData = true;
        });
      }
    } catch (e) {
      // snackbar( e.toString());
    }
    setState(() {
      looding = false;
    });
  }

  @override
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const backDesgin(),
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
                      myButton(
                          width: vwidth,
                          function: () {
                            register();
                          },
                          name: "Sign Up",
                          loading: false),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const sigupScreen()),
                            );
                          },
                          child: const Text("Already have an account"))
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
