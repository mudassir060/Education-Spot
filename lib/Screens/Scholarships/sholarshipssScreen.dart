import 'package:education_spot/Screens/Scholarships/sholarshipCard.dart';
import 'package:education_spot/Widgets/mySpacer.dart';
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
                padding: const EdgeInsets.only(top: 25, left: 15.0),
                child: Text(
                  "Discover your dream sholarships",
                  style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
                ),
              ),
              mySpacer(10.0, 0.0),
              // // // // // // // // // // // Search Box // // // // // // // // //
              Container(
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: primaryColor,
                ),
                padding: const EdgeInsets.only(left: 15.0),
                child: const TextField(
                  // controller: textcontroler,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      hintText: "Search a sholarships or a position",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none),
                ),
              ),
              mySpacer(10.0, 0.0),
              // // // // // // // // // // // Featured sholarships // // // // // // // // //
              Row(
                children: [
                  Text(
                    "Featured sholarships",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              // // // // // // // // // // // Featured CArd // // // // // // // // //

              sholarshipCard(
                img: images,
                titel: "Senior, Graphic Design",
                subTitel: "WINGMAN CO.",
                location: "Bali, Indonesia",
                sallery: "1600-2000/Years",
              ),
              // // // // // // // // // // // Recomended titel // // // // // // // // //


            ],
          ),
        ),
      ),
    ));
  }
}
