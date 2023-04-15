import 'package:education_spot/Screens/authentication/signInScreen.dart';
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

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Password reset email sent to $email'),
      duration: Duration(seconds: 5),
    ));

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => signInScreen()),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Something went wrong please try again later"),
      duration: Duration(seconds: 5),
    ));
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
        toolbarHeight: 12,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 16,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.only(left: 4, top: 4),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: primaryColor.withOpacity(0.2)),
            child: Center(
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
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Reset Password",
                    ),
                    Text(
                      "No problem! Just enter your email address and we'll send you a one-time password to recover your password.",
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    myTextfield(
                      titel: 'Email Address',
                      hint: 'Email Address',
                      textcontroler: emailController,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    myButton(
                        width: w,
                        function: () {
                          _resetPassword(context);
                        },
                        name: "Forget Password",
                        loading: false),
                    // AppButton(
                    //     button_text: 'Next',
                    //     isIconPresent: false,
                    //     onPress: () {
                    //       _resetPassword(context);
                    //     }
                    //  resetPasswordProvider.isValid
                    // ? () {
                    //     Navigator.pushNamed(context,
                    //         RouteName.otpVerificationEmailRoute);
                    //     print(
                    //         resetPasswordProvider.email.toString());
                    //   }
                    // : () {
                    //     print("Email is required");
                    //   }
                  ],
                ),
                SizedBox(
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
