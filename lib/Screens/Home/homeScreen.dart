import 'package:education_spot/Widgets/mySpacer.dart';
import 'package:education_spot/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

import '../../Widgets/ImageButtonGrid.dart';
import '../../constants/images.dart';
import '../Admissions/AdmissionsScreen.dart';
import '../CV/CVScreen.dart';
import '../Community/communityScreen.dart';
import '../CompleteProfile/completeProfile_1.dart';
import '../Jobs/jobsScreen.dart';
import '../Quizz/QuizzScreen.dart';
import '../Scholarships/sholarshipsScreen.dart';
import '../chatGPT/chat_page.dart';

class homeScreen extends StatefulWidget {
  final Map UserData;
  const homeScreen({Key? key, required this.UserData}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  var sliderImg = [Banner_1, Banner_2, Banner_3];
  @override
  Widget build(BuildContext context) {
    var buttonList = [
      {
        "name": "Scholarship",
        "image": Scholarships2,
        "page": sholarshipsScreen()
      },
      {"name": "Admission", "image": Admissions, "page": AdmissionsScreen()},
      {"name": "Quiz", "image": Quiz, "page": QuizzScreen()},
      {"name": "Job", "image": Jobs, "page": jobsScreen()},
      // {
      //   "name": "Chat GPT",
      //   "image": "assets/chatgpt-icon.png",
      //   "page": ChatPage(
      //     // UserData: widget.UserData,
      //   )
      // },
      {
        "name": "Create CV", "image": cv,
        // "page": CVScreen(
        //   UserData: widget.UserData,
        // )
        // "page": completeProfile_1(userData: widget.UserData,)
        "page": true
      },
    ];
    var vwidth = MediaQuery.of(context).size.width;
    var vheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            mySpacer(10.0, 0.0),
            // // // // // // // // // // // Top Bar // // // // // // // // //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CircleAvatar(
                  backgroundColor: primaryColor,
                  child: Icon(
                    Icons.book,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "Education Spot",
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    // Handle the selection of a menu item
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'item1',
                      child: Text('Rate us'),
                    ),
                    const PopupMenuItem(
                      value: 'item2',
                      child: Text('About us'),
                    ),
                    // ignore: prefer_const_constructors
                    PopupMenuItem(
                      value: 'item3',
                      child: const Text('Contact us'),
                    ),
                  ],
                ),
              ],
            ),
            // // // // // // // // // // // Banner Ad // // // // // // // //
            Container(
              height: 200,
              child: CarouselSlider.builder(
                  // key: _sliderKey,
                  unlimitedMode: true,
                  slideBuilder: (index) {
                    return Image.asset(sliderImg[index]);
                  },
                  slideTransform: CubeTransform(),
                  slideIndicator: CircularSlideIndicator(
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  itemCount: sliderImg.length),
            ), // // // // // // // // // // // Gridview Button // // // // // // // // //
            ImageButtonGrid(
              Community: buttonList,
              UserData: widget.UserData,
            )
          ],
        ),
      )),
    );
  }
}
