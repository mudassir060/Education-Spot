import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../constants/images.dart';

class abouteScreen extends StatefulWidget {
  const abouteScreen({super.key});

  @override
  State<abouteScreen> createState() => _abouteScreenState();
}

class _abouteScreenState extends State<abouteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(child: Image(image: AssetImage(group_pic))),
          Text(
            "About Us",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "Education support is a mobile application that provide latest information on scholarship,job opportunties and addmission in pakistan universtites.You can create cv from this app and get expert help in the community.Our goal is empower student with necessary recources and guidance to achieve their academic and professional expiration",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
