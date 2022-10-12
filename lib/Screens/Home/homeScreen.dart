import 'package:education_spot/Widgets/mySpacer.dart';
import 'package:education_spot/constants/style.dart';
import 'package:flutter/material.dart';

import '../../Widgets/ImageButtonGrid.dart';
import '../../constants/images.dart';
import '../Scholarships/sholarshipsScreen.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    var buttonList = [
      {
        "name": "Scholarships",
        "image": Scholarships2,
        "page": sholarshipsScreen()
      },
      {"name": "Admissions", "image": Admissions, "page": null},
      {"name": "Quiz", "image": Quiz, "page": null},
      {"name": "Jobs", "image": Jobs, "page": jobsScreen()},
    ];
    var data = buttonList.length;
    var quot = (data / 2).floor();
    var rem = data.remainder(2);
    if (rem >= 1) {
      data = quot + 1;
    } else {
      data = quot;
    }
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
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      color: primaryColor,
                    ))
              ],
            ),
            // // // // // // // // // // // Banner Ad // // // // // // // //
            Image.asset(Banner_Ad),
            // // // // // // // // // // // Gridview Button // // // // // // // // //
            ImageButtonGrid(vheight: data.toDouble(), Community: buttonList)
          ],
        ),
      )),
    );
  }
}
