import 'package:education_spot/Screens/Scholarships/sholarshipCard.dart';
import 'package:education_spot/Widgets/mySpacer.dart';
import 'package:education_spot/Widgets/smallButton.dart';
import 'package:flutter/material.dart';
import '../../constants/images.dart';
import '../../constants/style.dart';

class sholarshipsScreen extends StatefulWidget {
  const sholarshipsScreen({Key? key}) : super(key: key);

  @override
  State<sholarshipsScreen> createState() => _sholarshipsScreenState();
}

class _sholarshipsScreenState extends State<sholarshipsScreen> {
  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vheight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              // // // // // // // // // // // Titel // // // // // // // // //
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  "Available Sholarships",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              mySpacer(10.0, 0.0),
              // // // // // // // // // // // Search Box // // // // // // // // //
              Container(
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.only(left: 15.0),
                child: const TextField(
                  // controller: textcontroler,
                  style: TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      hintText: "Search for a scholarships",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none),
                ),
              ),
              mySpacer(10.0, 0.0),
              // // // // // // // // // // // Featured sholarships // // // // // // // // //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  smallButton("Matric", () {}, false),
                  smallButton("Intermediate", () {}, false),
                  smallButton("University", () {}, false),
                ],
              ),
              mySpacer(10.0, 0.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  smallButton("Merit base", () {}, false),
                  smallButton("Need base", () {}, false),
                  smallButton("Others", () {}, false),
                ],
              ),
              // // // // // // // // // // // Featured CArd // // // // // // // // //
              sholarshipCard(
                img: images,
                titel: "HEC Need Base Scholarship",
                subTitel: "GOVERNMENT UNIVERSITIES",
                type: 'Need base',
                date: '11 Sep 2022',
                dagre: 'Bachelor',
              ),
              sholarshipCard(
                img: images,
                titel: "HEC Need Base Scholarship",
                subTitel: "GOVERNMENT UNIVERSITIES",
                type: 'Need base',
                date: '11 Sep 2022',
                dagre: 'Bachelor',
              ),  sholarshipCard(
                img: images,
                titel: "HEC Need Base Scholarship",
                subTitel: "GOVERNMENT UNIVERSITIES",
                type: 'Need base',
                date: '11 Sep 2022',
                dagre: 'Bachelor',
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
