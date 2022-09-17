import 'package:education_spot/Widgets/mySpacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../constants/images.dart';
import '../../constants/style.dart';

class jobsScreen extends StatefulWidget {
  const jobsScreen({Key? key}) : super(key: key);

  @override
  State<jobsScreen> createState() => _jobsScreenState();
}

class _jobsScreenState extends State<jobsScreen> {
  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vheight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            // // // // // // // // // // // Titel // // // // // // // // //
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 15.0),
              child: Text(
                "Discover your dream job",
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
                    hintText: "Search a job or a position",
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none),
              ),
            ),
            mySpacer(10.0, 0.0),
            // // // // // // // // // // // Featured Jobs // // // // // // // // //
            Row(
              children: [
                Text(
                  "Featured Jobs",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            Container(
              width: vwidth,
              // height: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: primaryColor,
              ),
              padding: const EdgeInsets.all(15.0),
              margin: const EdgeInsets.only(top: 15.0, bottom: 10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(images),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      mySpacer(0.0, 15.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Senior, Graphic Design",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "WINGMAN CO.",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  mySpacer(10.0, 0.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      smallbutton("Design", () {}),
                      smallbutton("Full-Time", () {}),
                      smallbutton("Product", () {}),
                    ],
                  ),
                  mySpacer(10.0, 0.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon( Icons.location_on, color: Colors.white,),
                          Text(
                            "Bali, Indonesia",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),  Row(
                        children: [
                          Text(
                            "1600-2000/Years",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          Icon( Icons.payment, color: Colors.white,),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

Widget smallbutton(titel, fun) {
  return InkWell(
    onTap: () {
      fun;
    },
    child: Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.5),
      ),
      child: Center(
          child: Text(
        titel,
        style: TextStyle(color: Colors.white, fontSize: 16),
      )),
    ),
  );
}
