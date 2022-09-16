import 'package:education_spot/Widgets/mySpacer.dart';
import 'package:education_spot/constants/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
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
                    fontSize: 20),
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

          // // // // // // // // // // // Gridview Button // // // // // // // // //

        ],
      )),
    );
  }
}
