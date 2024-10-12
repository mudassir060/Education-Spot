import 'package:education_spot/Screens/authentication/signInScreen.dart';
import 'package:education_spot/Widgets/snackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Widgets/myButton.dart';
import '../../Widgets/myTextfield.dart';
import '../../constants/style.dart';

class forgetPassword extends StatefulWidget {
  const forgetPassword({
    super.key,
  });

  @override
  State<forgetPassword> createState() => _forgetPasswordState();
}

Future<void> _resetPassword(context) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

  
    snackBar(context, 'Password reset email sent to $email');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const signInScreen()),
    );
  } catch (e) {
    snackBar(context, e);
  }
}

TextEditingController emailController = TextEditingController();
String email = "";

class _forgetPasswordState extends State<forgetPassword> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffFFFBFB),
      appBar: AppBar(
        toolbarHeight: 52,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 56,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.only(left: 4, top: 4),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: primaryColor.withOpacity(0.2)),
            child: const Center(
              child: Icon(
                Icons.chevron_left_outlined,
                color: primaryColor,
                size: 28,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Reset Password",
                  style:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold ,color: primaryColor),
                ),
                const Text(
                  "No problem! Just enter your email address and we'll send you a one-time password to recover your password.",
                  // textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 13,
                ),
                myTextfield(
                  titel: 'Email Address',
                  hint: 'Email Address',
                  textcontroler: emailController,
                ),
                const SizedBox(
                  height: 14,
                ),
                myButton(
                    width: w,
                    function: () {
                      _resetPassword(context);
                    },
                    name: "Reset Password",
                    loading: false),
                const SizedBox(
                  height: 36,
                ),
                // AppRichText(
                //     normalText: "Don’t have access to the email address?  ",
                //     focusText: "Try Another way",
                //     onPress: () {
                //       Navigator.pushNamed(
                //           context, RouteName.resetPasswordPhoneRoute);
                //     })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
