import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_spot/Screens/authentication/sigupScreen.dart';
import 'package:education_spot/Widgets/myButton.dart';
import 'package:education_spot/constants/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  TextEditingController emailCTRL = TextEditingController(text: "abc@gmail.com");
  TextEditingController passwordCTRL = TextEditingController(text: "qwerty");

  bool looding = false;
  bool _obscureText = true;

  // FlutterSecureStorage storage = const FlutterSecureStorage();


  void register() async {
    setState(() {
      looding = true;
    });
    var UserData;
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final String useremail = emailCTRL.text.trim();
    final String userpassword = passwordCTRL.text;
    try {
      if (
      useremail != '' &&
          userpassword != '') {
        final UserCredential user = await auth.signInWithEmailAndPassword(
            email: useremail, password: userpassword);
        final DocumentSnapshot snapshot =
        await firestore.collection("users").doc(user.user?.uid).get();
        // storage.write(key: "UID", value: user.user?.uid);
        final data = snapshot.data();
        setState(() {
          UserData = data;
        });
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BottomNavigBar(UserData:UserData,)),
        );
      } else {
        // snackbar("Please fill all text field");
      }
    } catch (e) {
      // snackbar(e.toString());
    }
    setState(() {
      looding = false;
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
            backDesgin(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                mySpacer(40.0, vwidth),
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
                    color: Colors.white60,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      myTextfield(
                        titel: 'EMAIL',
                        hint: 'email',
                        textcontroler: emailCTRL,
                      ),
                      Column(
                        children: [
                          myTextfield(
                            titel: 'PASSWORD',
                            hint: 'password',
                            textcontroler: passwordCTRL,
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
                           register();
                          },
                          name: "Sign In",
                          loading: looding),
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
