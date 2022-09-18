import 'package:education_spot/Widgets/mySpacer.dart';
import 'package:education_spot/constants/style.dart';
import 'package:flutter/material.dart';

import '../../constants/images.dart';
import '../Jobs/jobsScreen.dart';
import '../Scholarships/sholarshipsScreen.dart';
import 'imageButton.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          body: Column(
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
          Image.asset(Banner_Ad ),
          // // // // // // // // // // // Gridview Button // // // // // // // // //
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              imageButton(
                img: Scholarships,
                titel: 'Scholarships',
                fun: () {
                  print("Scholarships");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => sholarshipsScreen()),
                  );
                },
              ),
              imageButton(
                img: Admassions,
                titel: 'Admassion',
                fun: () {},
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              imageButton(
                img: Quizz,
                titel: 'Quizz',
                fun: () {},
              ),
              imageButton(
                img: Available_Jobs,
                titel: 'JObs',
                fun: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => jobsScreen()),
                  );
                },
              )
            ],
          ),
        ],
      )),
    );
  }
}
