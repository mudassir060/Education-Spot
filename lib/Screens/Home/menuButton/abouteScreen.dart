import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../constants/images.dart';


class about_screen extends StatefulWidget {
  const about_screen({super.key});

  @override
  State<about_screen> createState() => _about_screenState();
}

class _about_screenState extends State<about_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Center(child: Image(image: AssetImage(group_pic))),
            // color: Colors.black,
           
          ),

          Text("About Us",style: TextStyle(fontWeight: FontWeight.bold,fontSize:30),),

          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Text("Education support is a mobile application that provide latest information on scholarship,job opportunties and addmission in pakistan universtites.You can create cv from this app and get expert help in the community.Our goal is empower student with necessary recources and guidance to achieve their academic and professional expiration",textAlign: TextAlign.justify,style: TextStyle(fontSize: 18),),
          )
        ],
      ),
    );
  }
}
