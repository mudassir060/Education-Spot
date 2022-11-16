import 'package:education_spot/Screens/Jobs/recomendedCard.dart';
import 'package:education_spot/Widgets/myAppBar.dart';
import 'package:education_spot/Widgets/mySpacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../constants/images.dart';
import '../../constants/style.dart';
import 'featuredCard.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // // // // // // // // // // // Top Bar // // // // // // // // //
            myAppBar(titel: "Discover job", linewidth: 150),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     InkWell(onTap: (){
            //       Navigator.pop(context);
            //     }, child: Image.asset(backCurve)),
            //     mySpacer(0.0, 0.0),
            //     Column(
            //       children: [
            //         const Text(
            //           "Discover job",
            //           style:
            //           TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            //         ),
            //         mySpacer(10.0, 0.0),
            //         Container(
            //           width: 200,
            //           height: 2,
            //           color: primaryColor,
            //         )
            //       ],
            //     ),
            //     mySpacer(0.0, 0.0),
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
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
                  // // // // // // // // // // // Featured CArd // // // // // // // // //

                  featuredCard(
                    img: images,
                    titel: "Senior, Graphic Design",
                    subTitel: "WINGMAN CO.",
                    location: "Bali, Indonesia",
                    sallery: "1600-2000/Years",
                  ),
                  // // // // // // // // // // // Recomended titel // // // // // // // // //

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recomended",
                          style:
                              TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "See All",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  // // // // // // // // // // // Recomended Jobs // // // // // // // // //

                  Container(
                    height: 180,
                    width: vwidth,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children:const [
                        recomendedCard(
                          img: images,
                          titel: 'UX Writte',
                          subTitel: 'WINGMAN CO.',
                          location: 'California',
                          timing: 'Full Time',
                          sallery: '20/Hours',
                        ), recomendedCard(
                          img: images,
                          titel: 'UX Writte',
                          subTitel: 'WINGMAN CO.',
                          location: 'California',
                          timing: 'Full Time',
                          sallery: '20/Hours',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
